# phd-plan

First time setup:

`cd ./phd-plan/Inputs/`

`make install`

---

To compile latex/bibtex to pdf:

In ./phd-plan:

`make`

---

### To edit some section:

Get updated files

`git pull`

Create new branch to edit selected section:

`git branch edit-sectionX`

Checkout the branch for the current section:

`git checkout edit-sectionX`

After editing, add all files:

`git add --all .`

Commit the files:

`git commit -a -m "Your message"`

Push to your branch:

`git push origin edit-sectionX`

---

