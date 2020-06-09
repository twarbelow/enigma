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

## Final Notes
* I think, if I were willing to stay up tonight, I would be able to get the rest of christopher working with a CLI. In addition, I would refactor enigma and enigma test to account for characters not in my alphabet hash. I think that fix would consist of: 1. writing a test with a message that includes characters outside of my alphabet hash, with the expectation that those characters stay where they are and as they are, 2. implement an if statement that queries if the character being iterated over is in the alphabet and if it is not then shoveling the character as is into shifted_msg (and otherwise proceeding as already written in the code).
* Alternatively, could have started the project earlier. While I do think that would have afforded me more time to get entirely through the cracking portion of the project, and maybe more refactoring, I am glad that I balanced toward dealing with the rest of my life before starting the project. I am in the middle of moving, and I think it would have left me more stressed to not work on that till after the project. Trying to find a healthy balance between school and the rest of life is challenging. I think that the general consensus tells us to go hard on school while you are doing it, and everything else can wait, but I feel like shit when I do that. Before now, I've always pushed myself to be the best in my class, but it always ended with me being so depressed/anxious/stressed that I would have a sharp decline in performance after the first bit of it. Kind of like trying to sprint during a long race. So, maybe good enough is good enough? Maybe it is ok to not always be the best as long as I'm learning what I need to learn.
