# README

This api process a url and parse html using Nokogiri gem, then using the css method searches for h1,h2,h3 tags and search for links then classifies them into hashes that are save on DB as JSON to easy process.

Headers are save in a json structure like this:
```
{
  "h1":["head1", "head2"...],
  "h2":["head1", "head2"...],
  "h3":["head1", "head2"...],
}
```

Links are save in a json structure like this:
```
[
  {
    "url": "http://somesite.com",
    "text": "original text from the link"
  }
  ...
]
```
