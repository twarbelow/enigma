# enigma

## Self-Evaluation
* Functionality 3+
  * enigma class complete with full testing and CLI interface
  * cracking method working, but was not able to get the key to return, CLI not implemented yet
* Object Oriented Programming 3+
  * I believe that there are many ways to break this project down. As my enigma class was not long to begin with, I did not want to complicate the repository lib file with unnecessary extra modules/inherited classes. I refactored in a way that the enigma machine itself wouldn't know about the cracking ability of christopher (inspired by the movie). I think it would be possible to refactor something into a module to slim down the encrypt, decrypt, and crack methods even more, since they contain two of the same methods in the same order, but I'm not sure it would be worth it. Would like to talk about this more. The one method that I particulary would be particularly interested in seeing if there were a better way would be shift_msg in the enigma class.
* Ruby Conventions and Mechanics 3+
  * Styling is consistent, and lines are not excessively long (would perhaps break up 57 in enigma class, although I personally prefer this one as a one liner...happy to be convinced otherwise). I believe I reasonable job using enumerators, and I think my alphabet hash is super useful :)
* Test Driven Development 2-3+
  * I forgot that I wanted to account for characters outside my alphabet. Otherwise, I stuck to TDD pretty hardcore. 100% coverage.
* Version Control 3+
  * 64 commits, 4 branches, 5 PRs. I think my PRs could be more specific. As I was the only one working on the project, it was easy for me to deal with, but I think it would be good to be more specific with a group. I do think my commit messages are clear and concise.

## Issues
* ran into git flow issue where commits were somehow lost for lib/enigma.rb up till the first commit showing here. 
