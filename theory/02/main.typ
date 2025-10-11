#let title = "Assignment 2"
#let subtitle = "Computer Networks (Theory)"
#let student = (name: "Langxi Yuan", id: "23336294")

#set document(
  title: title,
  author: student.name,
)

#set enum(numbering: "a.")

#set par(justify: true)

#show link: set text(fill: blue)

#show raw.where(block: true): it => block(fill: luma(90%), inset: 0.2em, outset: 0.2em, radius: 0.2em, it)
#show raw.where(block: false): it => box(fill: luma(90%), inset: (x: 0.2em), outset: (y: 0.2em), radius: 0.2em, it)

#let solution(body) = block(inset: 0.5em)[
  *_Solution._* #body
]

#page({
  set align(center)

  text(size: 3em, weight: "bold", title)

  v(0em)
  
  text(size: 2em, weight: "bold", subtitle)

  v(9em)

  text(size: 1.5em, student.name)

  v(0em)

  text(size: 1.5em, student.id)
})
  
= P4

#solution[
  + The URL is http://gaia.cs.umass.edu/cs453/index.html. The `Host` line contains the server's name and the `GET` line contains the file's name.

  + `HTTP 1.1`, as shown in the `GET` line.

  + Persistent connection, indicated by `Connection: keep-alive`.

  + Not specified.

  + Netscape 7.2 running on Windows XP, specified in the `User-Agent` line. The browser type (User-Agent) is sent so that the server can customize the content for different browsers.
]

= P7

#solution[
  Let $r_i$ denote the RTT to the $i$-th server.

  - Time to obtain IP address: $r_1 + r_2 + ... + r_n$.

  - Time to initiate TCP connection: $r_0$.

  - Time to send HTTP request and receive the first byte of HTTP response: $r_0$.

  - Transmission time: $0.002 times r_0$.

  Total response time: $2.002 times r_0 + r_1 + r_2 + ... + r_n$.
]

= P8

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

#solution[
  The `MAIL FROM` in SMTP is a message that indicates the sender of the email. The `From` in the mail is not an SMTP message, but a line in the body of the message.
]

= P18

#solution[
  + A _whois_ database is a database that stores an Internet resource's registered users or assignees.

  + See @tab-1.

  + See @tab-2.

  + My school: www.sysu.edu.cn (202.116.64.8, 2001:250:3002:10::8).

  + "Sorry, we found no results for www.sysu.edu.cn".

  + An attacker can use _whois_ databases and the nslookup tool to determine the institution's IP address ranges, DNS servers, etc.

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

#solution[
  Make the server transmit to each peer at a rate of $min{u_s / N, d_min}$.
]

= P24

#solution[
  "It turns out that if we imagine that each peer can redistribute a bit as soon as it receives the bit, then there is a redistribution scheme that actually achieves this lower bound." To achieve this, we must have

  $
    r_1 + ... + r_N <= u_s, \
    (N - 1) r_i <= u_i, wide "for" i = 1, ..., N,
  $

  where $r_i$ is the actual transmission rate from the server to peer $i$. Therefore, for (a), since $u_s$ is rather small, our $r$'s are capped by the first inequality, and we would let $r_i = u_i / (u_1 + ... + u_N) times u_s$.

  For (b), $r$'s are capped by the second inequality, leaving $r_i = u_i / (N - 1)$. Moreover, to make full use of the server's capacity, we should split the residual rate $r_r = u_s - (r_1 + ... + r_N)$ equally to all peers.

  For (c), just combine the conclusions from (a) and (b) with Equation 2.2.
]

= P26

#solution[
  Alice is mostly correct. In BitTorrent, peers that contribute more bandwidth get priority when downloading. If Bob be a pure free-rider, others will typically deprioritize or refuse to upload to him.

  However, Bob can write a script to make his different hosts ask for different chunks of the file. In this way, each host appears as a "new" peer and can exploit initial generosity from seeders.
]
