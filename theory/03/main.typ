#import "@local/sysu-templates:0.2.0": exercise

#show: exercise.with(
  title: "Exercise 3",
  subtitle: "Computer Networks (Theory)",
  student: (name: "Langxi Yuan", id: "23336294"),
)

#page([
  #set align(center + horizon)

  Made with Typst.

  Source code available at:

  https://github.com/yuanlx27/2025-computer-networks
])

#set enum(numbering: "a.")

#let solution(body) = block(inset: 0.5em, width: 100%)[
  *_Solution._* #body
]

= P3

UDP and TCP use 1s complement for their checksums.
Suppose you have the following three 8-bit bytes: 01010011, 01100110, 01110100.
What is the 1s complement of the sum of these 8-bit bytes?
(Note that although UDP and TCP use 16-bit words in computing the checksum, for this problem you are being asked to consider 8-bit sums.)
Show all work. Why is it that UDP takes the 1s complement of the sum; that is, why not just use the sum?
With the 1s complement scheme, how does the receiver detect errors? Is it possible that a 1-bit error will go undetected? How about a 2-bit error?

#solution[
  First, take wrapped sum:

  $
    (01010011)_2 + (01100110)_2 + (01110100)_2 = (00101110)_2.
  $

  Then take 1s complement:

  $
    (00101110)_2 stretch(->)^"reverse bits" (11010001)_2.
  $

  Using 1s complement allows an easier way to detect errors: add up all received words, including the checksum, and check if the result is all 1s.
  1-bit errors will always be detected, but some 2-bit errors may not (see 4.c for an example).
]

= P4

+ Suppose you have the following 2 bytes: 01011100 and 01100101.
  What is the 1s complement of the sum of these 2 bytes?

+ Suppose you have the following 2 bytes: 11011010 and 01100101.
  What is the 1s complement of the sum of these 2 bytes?

+ For the bytes in part (a), give an example where one bit is flipped in each of the 2 bytes and yet the 1s complement doesn’t change.

#solution[
  + The result is 00111110.

  + The result is 10111111.

  + Flip the lowest bit of both bytes.
]

= P14

Consider a reliable data transfer protocol that uses only negative acknowledgments.
Suppose the sender sends data only infrequently.
Would a NAK-only protocol be preferable to a protocol that uses ACKs? Why?
Now suppose the sender has a lot of data to send and the end-to-end connection experiences few losses.
In this second case, would a NAK-only protocol be preferable to a protocol that uses ACKs? Why?

#solution[
  ACK protocols are more responsive, giving instant feedback, but also incur more overhead, best for frequent transmissions.
  NAK protocols, on the other hand, use less traffic, but force the sender to wait for timeouts, better for infrequent transmissions.

  Hence the answer is yes for the first case, and no for the second case.
]

= P15

Consider the cross-country example shown in @fig-1.
How big would the window size have to be for the channel utilization to be greater than 98 percent?
Suppose that the size of a packet is 1500 bytes, including both header fields and data.

"The speed-of-light round-trip propagation delay between these two end systems, $"RTT"$, is approximately 30 milliseconds.
Suppose that they are connected by a channel with a transmission rate, $R$, of 1 Gbps (10#super[9] bits per second)."

#figure(
  caption: "Figure 3.17 from textbook",
  image("assets/images/20251030-064934.png")
) <fig-1>

#solution[
  Let

  $
    U = (n dot L / R) / ("RTT" + L / R) = (n dot (1500 times 8) / 10^9) / (0.03 + (1500 times 8) / 10^9) > 0.98.
  $

  This gives

  $
    n > 2450.98,
  $

  that is, the window size has to be at least 2451 packets.
]

= P22

Consider the GBN protocol with a sender window size of 4 and a sequence number range of 1024.
Suppose that at time $t$, the next in-order packet that the receiver is expecting has a sequence number of $k$.
Assume that the medium does not reorder messages. Answer the following questions:

+ What are the possible sets of sequence numbers inside the sender's window at time $t$? Justify your answer.

+ What are all possible values of the ACK field in all possible messages currently propagating back to the sender at time $t$? Justify your answer.

#solution[
]

= P23

Consider the GBN and SR protocols.
Suppose the sequence number space is of size $k$.
What is the largest allowable sender window that will avoid the occurrence of problems such as that in Figure 3.27 for each of these protocols?

#solution[
]

= P27

Host A and B are communicating over a TCP connection,
and Host B has already received from A all bytes up through byte 126.
Suppose Host A then sends two segments to Host B back-to-back.
The first and second segments contain 80 and 40 bytes of data, respectively.
In the first segment, the sequence number is 127, the source port number is 302, and the destination port number is 80.
Host B sends an acknowledgment whenever it receives a segment from Host A.

+ In the second segment sent from Host A to B, what are the sequence number, source port number, and destination port number?

+ If the first segment arrives before the second segment, in the acknowledgment of the first arriving segment,
  what is the acknowledgment number, the source port number, and the destination port number?

+ If the second segment arrives before the first segment, in the acknowledgment of the first arriving segment,
  what is the acknowledgment number?

+ Suppose the two segments sent by A arrive in order at B.
  The first acknowledgment is lost and the second acknowledgment arrives after the first timeout interval.
  Draw a timing diagram, showing these segments and all other segments and acknowledgments sent. (Assume there is no additional packet loss.)
  For each segment in your figure, provide the sequence number and the number of bytes of data; for each acknowledgment that you add, provide the acknowledgment number.

= P32

Consider the TCP procedure for estimating RTT.
Suppose that $alpha = 0.1$. Let SampleRTT#sub[1] be the most recent sample RTT, let SampleRTT2 be the next
most recent sample RTT, and so on.
a. For a given TCP connection, suppose four acknowledgments have been
returned with corresponding sample RTTs: SampleRTT4, SampleRTT3,
SampleRTT2, and SampleRTT1. Express EstimatedRTT in terms of
the four sample RTTs.
b. Generalize your formula for n sample RTTs.
c. For the formula in part (b) let n approach infinity. Comment on why this
averaging procedure is called an exponential moving average.

= P36

= P40

= P43
