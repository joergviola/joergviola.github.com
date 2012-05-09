---
layout: post
title: "Simple website search with Lucene?"
date: 2012-05-09 18:38
comments: true
categories: Lucene 
---
Have you ever tried to implement search in your web app?
Should be easy, eh?
And of course you want:

* To search in all text-fields of nearly all entities in your model
* To get suggestions while the user types the query
* To have the query term highlighted in the search results.
* Update the index as the model changes

Since these requirements seem fairly basic, I was surprised how complicated 
they were to implement and how little documented.

<!-- more -->

Multi-field search
------------------

Indexing documents is easy, really. Simply:
``` java
IndexWriter w = new IndexWriter(directory, config);
Document doc = new Document();
doc.add(new Field("title", model.title, Field.Store.YES,Field.Index.ANALYZED));
doc.add(new Field("text", model.text, Field.Store.YES,Field.Index.ANALYZED));
w.addDocument(doc);
w.close();
```

But when it comes to search for a phrase in all of these fields, things become 
a little involved like so:

``` java
String[] FIELDS = { "title", "text" };
MultiFieldQueryParser parser = new MultiFieldQueryParser(
		Version.LUCENE_36, FIELDS, STANDARD_ANALYZER);
Query query = parser.parse(q + "*");

int hitsPerPage = 10;
IndexReader reader = IndexReader.open(directory);
IndexSearcher searcher = new IndexSearcher(reader);
TopScoreDocCollector collector = TopScoreDocCollector.create(
		hitsPerPage, true);
searcher.search(query, collector);
ScoreDoc[] hits = collector.topDocs().scoreDocs;
for (int i = 0; i < hits.length; ++i) {
	int docId = hits[i].doc;
	Document document = searcher.doc(docId);
	// Do something with it!
}
```

Suggestions
-----------

I could not yet figure that out, honestly!

Highlighting
------------

After having retrieved the document, don't simply call e.g. ```document.get("text")```, but:
``` java
TermPositionVector termPosVector = (TermPositionVector) searcher
		.getIndexReader().getTermFreqVector(docId, "text");
TokenStream stream = TokenSources.getTokenStream(termPosVector);
QueryScorer scorer = new QueryScorer(query);
Fragmenter fragmenter = new SimpleSpanFragmenter(scorer, 10000);
Highlighter highlighter = new Highlighter(scorer);
highlighter.setTextFragmenter(fragmenter);
highlighter.setMaxDocCharsToAnalyze(Integer.MAX_VALUE);

String[] frag = highlighter.getBestFragments(stream, doc.get("text"), 1);
if (frag.length > 0)
	return frag[0];
else
	return fieldContents;
```
Since this assumes the Terms to be stored in the index, you must index the attribute as follows:
``` java
doc.add(new Field("text", seminar.text, Field.Store.YES,
		Field.Index.ANALYZED, Field.TermVector.WITH_POSITIONS_OFFSETS));
```

Updating the index
------------------

Maybe you do want to update your index whenever a model changes.
Using Play 2.0, I have overwritten the save() and update() methods:
``` java
	@Override
	public void update() {
		Search.update(this);
		super.update();
	}

	@Override
	public void save() {
		if (id == null)
			Search.add(this);
		else
			Search.update(this);
		super.save();
	}
```
using these methods:
``` java
public static void add(Model model) {
	IndexWriter w = new IndexWriter(directory, config);
	Document doc = createDocument(model);
	w.addDocument(doc);
	w.close();
} 
```
and
``` java
public static void update(Model model) {
	IndexWriter w = new IndexWriter(directory, config);
	Document doc = createDocument(model);
	Term term = new Term("id", doc.get("id"));
	if (model.state != model.State.Approved)
		w.deleteDocuments(term);
	else
		w.updateDocument(term, doc);
	w.close();
} 
```
So here another field id is used to find the document in the index. But beware! Don't analyze this field:
``` java
doc.add(new Field("id", "Model:" + model.id, Field.Store.YES,
		Field.Index.NOT_ANALYZED));
```
