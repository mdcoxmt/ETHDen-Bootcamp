## Desigining a Decentralized Monopoly
___

<p>
How would one design a decentralized Monopoly game? What new rules and practices need to be designed in order <br>
for the game to function? I've played some games in the past, namely [Nomic](https://en.wikipedia.org/wiki/Nomic), <br>
using email as the medium. I propose going as low-tech as possible, ala play-by-mail games. The Monopoly board <br>
would start as a numbered list with an initial state, all players starting at 1. Each number on the list would <br>
have a name & a few different pieces of info, listed below. As each player takes their turn, they send an email <br>
via Reply-all that includes all the updates their turn made to the list. 
</p>

### Challenges

<p>
At the core of Monopoly is randomness. How might a player roll a die or a draw a card randomly, while proving to<br>
other players that they aren't cheating?
</p>

### Essential Functionality
<ol>
  <li>
  Have individual player identities, each containing the following info:
  <ol>
    <li>
    Player Name
    </li>
    <li>
    Properties Held
    </li>
    <li>
    Money Held
    </li>
  </ol>
  </li>
<li>
View a shared board with different locations, each of which contains the following info:
<ol>
<li>
Space number 1-40
</li>
<li>
Property Name
</li>
<li>
Price
</li>
<li>
Set Name (color)
</li>
<li>
Improvements
</li>
<li>
Players at?
</li>
</ol>
</li>
<li>
Roll 2d6 dice and share the result with other players
</li>
<li>
Roll 1d16 and compare to the list of Community Chest cards
</li>
<li>
Roll 1d16 and compare to the list of Chance cards
</li>
<li>
Communicate board changes to all other players
</ol>

### Cheating

<p>
The main area for cheating is in the dice rolling. Without a central server to perform a dice roll, players will need to<br>
roll dice themselves, allowing players to falsify numbers. Since all other board changes are public, this is the only <br>
real opportunity for cheating. 
</p>

### Anti-Cheat Measures

<p>
One way to solve for 'randomness' is to tie player movement and dice rolls to something that's not quite random, but <br>
effectively impossible to control, such as the 'Received' time in of the prior email. A formula could be made to derive <br>
player movement and Chance/Community Chest draws from the milliseconds digits of the email's timestamp. Little of this <br>
is in player control, and a screengrab of the recieved time can be shared by individual players for verification if needed. <br>
(examples of such email metadata can be found in this article on forensic email analysis: https://www.metaspike.com/timestamps-forensic-email-examination/
</p>


