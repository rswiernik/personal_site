---
layout: post
title: What is Jekyll and how do you use it?
tag: markdown liquid
---

As you sit there surfing the web, you happen upon your friends website. It's simple, elegant, and looks nice. So you ask your friend how one might create such a site. His answer: Jekyll.

Jekyll is a powerful static blog generator that combines ease of use with robust markdown tools. It's real power, however, comes with it's modularity.

Your first step to making your is installing Jekyll. Since Jekyll is provided as a Ruby gem, it's as easy as making sure that your Ruby installation is up to date and executing the following commands:

{% highlight bash %}
~ $ gem install jekyll
~ $ jekyll new my-new-blog
~ $ cd my-new-blog
{% endhighlight %}

Once you've executed these commands, running *tree* shows the basic file structure that we've created:

{% highlight bash %}
~/example $ tree
.
├── _config.yml
├── css
│   ├── main.css
│   └── syntax.css
├── index.html
├── _layouts
│   ├── default.html
│   └── post.html
└── _posts
    └── 2014_03_03_welcome_to_jekyll.markdown

3 directories, 7 files
{% endhighlight %}

As you can see, the structure is relatively simple. With Jekyll, you have a basic workflow that goes something like this:

* You write a post, inserting layout, title, and tags into the front matter (We'll talk about this later)
* Place the post in the _posts folder
* As you compile your website, Jekyll looks at the front matter for each of the post to determine how it is to treat each of your pages, placing the material into whatever layout you have used for this post
* Jekyll then moves the finalized page into it's proper place under the _site folder

This can be done with you favorite editor such as vim or nano, simply place what you've written in the _posts folder and you're all set.

## Lets look inside a post

Composing a post is pretty simple, for example here's the markdown for the content you just read:

```
---
layout: _post
title: What is Jekyll and how do you use it?
tag: markdown liquid
---

As you sit there surfing the web, you happen upon your friends website. It's simple, elegant, and looks nice. So you ask your friend how one might create such a site. His answer: Jekyll.

Jekyll is a powerful static blog generator that combines ease of use with robust markdown tools. It's real power, however, comes with it's modularity.

Your first step to making your is installing Jekyll. Since Jekyll is provided as a Ruby gem, it's as easy as making sure that your Ruby installation is up to date and executing the following commands:

{% raw %}
{% highlight bash %}
~ $ gem install jekyll
~ $ jekyll new my-new-blog
~ $ cd my-new-blog
{% endhighlight %}
{% endraw %}

```

The front matter that I mentioned early is the material at the top of the post, notated by the '*---*' at the top of the file. Inside these tags you provide the basic information that identifies the page. 
