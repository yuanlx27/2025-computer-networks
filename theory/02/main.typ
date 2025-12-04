#import "@local/sysu-templates:0.2.0": exercise

#show: exercise.with(
  title: "Assignment 2",
  subtitle: "Computer Networks (Theory)",
  student: (name: "Langxi Yuan", id: "23336294"),
)

#page([
  #set align(center + horizon)

  Made with #link("https://typst.app")[Typst].

  Source code available at:

  https://github.com/yuanlx27/2025-computer-networks
])

#let solution(body) = block(inset: 0.5em)[
  *_Solution._* #body
]
  
= P4

Consider the following string of ASCII characters
that were captured by Wireshark when the browser sent an HTTP GET message
(i.e., this is the actual content of an HTTP GET message).
The characters `<cr><lf>` are carriage return and line-feed characters
(that is, the italized character string `<cr>` in the text below
represents the single carriage-return character that was contained at that point in the HTTP header).
Answer the following questions, indicating where in the HTTP GET message below you find the answer.

```
GET /cs453/index.html HTTP/1.1<cr><lf>Host: gai
a.cs.umass.edu<cr><lf>User-Agent: Mozilla/5.0 (
Windows;U; Windows NT 5.1; en-US; rv:1.7.2) Gec
ko/20040804 Netscape/7.2 (ax) <cr><lf>Accept:ex
t/xml, application/xml, application/xhtml+xml, text
/html;q=0.9, text/plain;q=0.8,image/png,*/*;q=0.5
<cr><lf>Accept-Language: en-us,en;q=0.5<cr><lf>Accept-
Encoding: zip,deflate<cr><lf>Accept-Charset: ISO
-8859-1,utf-8;q=0.7,*;q=0.7<cr><lf>Keep-Alive: 300<cr>
<lf>Connection:keep-alive<cr><lf><cr><lf>
```

+ What is the URL of the document requested by the browser?

+ What version of HTTP is the browser running?

+ Does the browser request a non-persistent or a persistent connection?

+ What is the IP address of the host on which the browser is running?

+ What type of browser initiates this message?
  Why is the browser type needed in an HTTP request message?

#solution[
  + The URL is http://gaia.cs.umass.edu/cs453/index.html.
    The `Host` line contains the server's name and the `GET` line contains the file's name.

  + `HTTP 1.1`, as shown in the `GET` line.

  + Persistent connection, indicated by `Connection: keep-alive`.

  + Not specified.

  + Netscape 7.2 running on Windows XP, specified in the `User-Agent` line.
    The browser type (User-Agent) is sent so that the server can customize the content for different browsers.
]

= P7

Suppose within your Web browser, you click on a link to obtain a Web page.
The IP address for the associated URL is not cached in your local host,
so a DNS lookup is necessary to obtain the IP address.
Suppose that $n$ DNS servers are visited before your host receives the IP address from DNS;
the successive visits incur an RTT of $"RTT"_1, dots, "RTT"_n$.
Further suppose that the Web page associated with the link contains exactly one object,
consisting of a large amount of HTML text.
Let $"RTT"_0$ denote the RTT between the local host and the server containing the object.
Assuming transmission duration of $0.002 "RTT"_0$ of the object,
how much time elapses from when the client clicks on the link until the client receives the object?

#solution[
  Let $r_i$ denote the RTT to the $i$-th server.

  - Time to obtain IP address: $r_1 + r_2 + ... + r_n$.

  - Time to initiate TCP connection: $r_0$.

  - Time to send HTTP request and receive the first byte of HTTP response: $r_0$.

  - Transmission time: $0.002 times r_0$.

  Total response time: $2.002 times r_0 + r_1 + r_2 + ... + r_n$.
]

= P8

Consider Problem P7 again and assume $"RTT"_0 = "RTT"_1 = "RTT"_2 = . . . "RTT"_n = "RTT"$,
furthermore, assume a new HTML file, small enough to have negligible transmission time,
which references nine equally small objects on the same server.
How much time elapses with

+ non-persistent HTTP with no parallel TCP connections?

+ non-persistent HTTP with the browser configured for 6 parallel connections?

+ persistent HTTP?

#solution[
  Let $r$ denote one RTT unit.

  + $(r_1 + ... + r_n) + r_0 + r_0 + (9 dot 2 r_0) = (n + 20) r$.

  + $(r_1 + ... + r_n) + r_0 + r_0 + (ceil.l 9 / 6 ceil.r dot 2 r_0) = (n + 6) r$.

  + #enum(
      numbering: "1)",
      [ Without pipelining: $(r_1 + ... + r_n) + r_0 + r_0 + 9 r_0 = (n + 11) r$; ],
      [ With pipelining: $(r_1 + ... + r_n) + r_0 + r_0 + r_0 = (n + 3) r$. ],
    )
]

= P15

What is the difference between `MAIL FROM:` in SMTP and `From:` in the mail message itself?

#solution[
  The `MAIL FROM` in SMTP is a message that indicates the sender of the email.
  The `From` in the mail is not an SMTP message, but a line in the body of the message.
]

= P18

+ What is a whois database?

+ Use various whois databases on the Internet to obtain the names of two DNS servers.
  Indicate which whois databases you used.

+ Use nslookup on your local host to send DNS queries to three DNS servers:
  your local DNS server and the two DNS servers you found in part (2).
  Try querying for Type A, NS, and MX reports. Summarize your findings.

+ Use nslookup to find a Web server that has multiple IP addresses.
  Does the Web server of your institution (school or company) have multiple IP addresses?

+ Use the ARIN whois database to determine the IP address range used by your university.

+ Describe how an attacker can use whois databases and the nslookup tool
  to perform reconnaissance on an institution before launching an attack.

+ Discuss why whois databases should be publicly available.

#solution[
  + A _whois_ database is a database that stores an Internet resource's registered users or assignees.

  + See @tab-1.

  + See @tab-2.

  + My school: www.sysu.edu.cn (202.116.64.8, 2001:250:3002:10::8).

  + "Sorry, we found no results for www.sysu.edu.cn".

  + An attacker can use _whois_ databases and the nslookup tool
    to determine the institution's IP address ranges, DNS servers, etc.

  + It helps researchers, law enforcement, and network administrators investigate cybercrime or misuse.

  #figure(
    caption: [_whois_ query results],
    table(
      columns: 3,
      table.header([*whois database*], [*domain name*], [*DNS server*]),
      [who.is], [archlinux.org], [helium.ns.hetzner.de],
      [www.whois.com], [nixos.org], [ns-161-c.gandi.net],
    ),
  ) <tab-1>

  #figure(
    caption: [nslookup results],
    table(
      columns: 4,
      align: center + horizon,
      table.header([*domain name*], [*web server(s)*], [*name server(s)*], [*mail server(s)*]),
      [helium.ns.hetzner.de], [helium.ns.hetzner.de \ 193.47.99.5], [ns1.your-server.de], [postmaster.your-server.de],
      [ns-161-c.gandi.net], [ns-161-c.gandi.net \ 217.70.187.162], [dns0.gandi.net], [hostmaster.gandi.net],
    ),
  ) <tab-2>
]

= P23

Consider distributing a file of $F$ bits to $N$ peers using a client-server architecture.
Assume a fluid model where the server can simultaneously transmit to multiple peers,
transmitting to each peer at different rates, as long as the combined rate does not exceed $u_s$.

+ Suppose that $u_s / N <= d_min$.
  Specify a distribution scheme that has a distribution time of $(N F) / u_s$.

+ Suppose that $u_s / N >= d_min$.
  Specify a distribution scheme that has a distribution time of $F / d_min$.

+ Conclude that the minimum distribution time is in general given by $max{(N F) / u_s, F / d_min}$.

#solution[
  Make the server transmit to each peer at a rate of $min{u_s / N, d_min}$.
]

= P24

Consider distributing a file of $F$ bits to $N$ peers using a P2P architecture.
Assume a fluid model.
For simplicity assume that $d_min$ is very large, so that peer download bandwidth is never a bottleneck.

+ Suppose that $u_s <= (u_s + u_1 + dots + u_N) / N$.
  Specify a distribution scheme that has a distribution time of $F / u_s$.

+ Suppose that $u_s >= (u_s + u_1 + dots + u_N) / N$.
  Specify a distribution scheme that has a distribution time of $(N F) / (u_s + u_1 + dots + u_N)$.

+ Conclude that the minimum distribution time
  is in general given by $ max{F / u_s, (N F) / (u_s + u_1 + dots + u_N)}. $

#solution[
  "It turns out that if we imagine
  that each peer can redistribute a bit as soon as it receives the bit,
  then there is a redistribution scheme that actually achieves this lower bound."
  To achieve this, we must have

  $
    r_1 + ... + r_N <= u_s, \
    (N - 1) r_i <= u_i, wide "for" i = 1, ..., N,
  $

  where $r_i$ is the actual transmission rate from the server to peer $i$.
  Therefore, for (a), since $u_s$ is rather small, our $r$'s are capped by the first inequality,
  and we would let $r_i = u_i / (u_1 + ... + u_N) times u_s$.

  For (b), $r$'s are capped by the second inequality, leaving $r_i = u_i / (N - 1)$.
  Moreover, to make full use of the server's capacity,
  we should split the residual rate $r_r = u_s - (r_1 + ... + r_N)$ equally to all peers.

  For (c), just combine the conclusions from (a) and (b) with Equation 2.2.
]

= P26

Suppose Bob joins a BitTorrent torrent,
but he does not want to upload any data to any other peers (he wants to be a so-called free-rider).

+ Alice who has been using BitTorrent tells Bob
  that he cannot receive a complete copy of the file that is shared by the swarm.
  Is Alice correct or not?
  Why?

+ Charlie claims that Alice is wrong
  and that he has even been using a collection of multiple computers (with distinct IP addresses)
  in the computer lab in his department to make his downloads faster,
  using some additional coordination scripting.
  What could his script have done?

#solution[
  Alice is mostly correct. In BitTorrent, peers that contribute more bandwidth get priority when downloading. If Bob be a pure free-rider, others will typically deprioritize or refuse to upload to him.

  However, Bob can write a script to make his different hosts ask for different chunks of the file. In this way, each host appears as a "new" peer and can exploit initial generosity from seeders.
]
