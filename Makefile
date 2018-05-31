GH_PAGES_SOURCES = aarhus.rst css/ img/ Makefile

main:
	hovercraft aarhus.rst -p 8000

html:
	hovercraft aarhus.rst _build

site:

# $ cd repo
# $ git checkout --orphan gh-pages
# $ git rm -rf .
# $ echo "First commit" > index.html
# $ git add .
# $ git commit -m "Just to create the branch."
# $ git push origin gh-pages

	git checkout gh-pages
	rm -rf aarhus.rst _build css/ img/
	git checkout master $(GH_PAGES_SOURCES)
	git reset HEAD
	make html
	cp -r -fv _build/* ./
	rm -rf _build
	echo "test.pierwill.com" > CNAME
	touch .nojekyll
	git add -A
	git commit -m "Generate gh-pages for `git log master -1 --pretty=short --abbrev-commit`" && \
	git push origin gh-pages; git checkout master
