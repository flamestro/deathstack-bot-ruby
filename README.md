# dsbotRuby
Bot for DeathStacks ( Boardgame ) <br>

This is a bot written in Ruby.  <br>
I did this for fun and to learn ruby. <br>
This bot uses fen notation.  <br>
Fen notation contains gamefield information AND the next player.  <br>
As example "rr,rr,rr,rr,rr,rr/,,,,,/,,,,,/,,,,,/,,,,,/bb,bb,bb,bb,bb,bb r"  <br> 
stands for red player = next and GameField : <br>
<table>
  <tr>
<th></th>
<th>a</th>
<th>b</th>
<th>c</th>
<th>d</th>
<th>e</th>
<th>f</th>

  </tr>
<tr> 
<td> 	6</td> 
<td> rr</td>
<td> rr</td>
<td> rr</td>
<td> rr</td>
<td> rr</td>
<td> rr</td>

</tr>
<tr> 
<td> 	5</td> 
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>

</tr>
<tr> 
	<td> 	4</td> 
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>

</tr>
<tr> 
	<td> 	3</td> 
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>

</tr>
<tr> 
	<td> 	2</td> 
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>

</tr>
<tr> 
	<td> 	1</td> 
<td> bb</td>
<td> bb</td>
<td> bb</td>
<td> bb</td>
<td> bb</td>
<td> bb</td>

</tr>

</table>

Two characters are reserved for players: 'b' for blue and 'r' for red  <br>
This bot has two main functionalities:  <br>
listMoves fenNotation  <br>
-> prints possible moves into the console  <br>
-> Moves are printed in this form : a1-2-a3 etc  <br>
-> console print is similiar to "[startposition-steps-endposition,.....,.....,....]"  <br>
getMove fenNotation  <br>
-> prints only one move into the console  <br>
-> printed in this form : "[a1-2-a3]"  <br>
-> the move which is printed, is choosen by a implementation of the minimax algorithm and chooses the best move [best for this implementation]  <br>

