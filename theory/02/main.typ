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

+ The URL is http://gaia.cs.umass.edu/cs453/index.html.
  The `Host` line contains the server's name and the `GET` line contains the file's name.

+ `HTTP 1.1`, as shown in the `GET` line.

+ Persistent connection, indicated by `Connection: keep-alive`.

+ Not specified.

+ Netscape 7.2 running on Windows XP, specified in the `User-Agent` line.
  The browser type (User-Agent) is sent so that the server can customize the content for different browsers.

= P7

Time to obtain IP address: $"RTT"_1 + "RTT"_2 + ... + "RTT"_n$.

Time to initiate TCP connection: $"RTT"_0$.

Time to send HTTP request and receive the first byte of HTTP response: $"RTT"_0$.

Transmission time: $0.002 times "RTT"_0$.

Total response time: $2.002 times "RTT"_0 + "RTT"_1 + "RTT"_2 + ... + "RTT"_n$.

= P8

+ $"RTT"_1 + ... + "RTT"_n + "RTT"_0 + "RTT"_0 + 9 dot 2 "RTT"_0 = (n + 20) "RTT"$.

+ $"RTT"_1 + ... + "RTT"_n + "RTT"_0 + "RTT"_0 + ceil.l 9 / 6 ceil.r dot 2 "RTT"_0 = (n + 6) "RTT"_0$.

+ #enum(
    [
      Without pipelining: $"RTT"_1 + ... + "RTT"_n + "RTT"_0 + "RTT"_0 + 9 dot "RTT"_0 = (n + 11) "RTT"_0$;
    ],
    [
      With pipelining: $"RTT"_1 + ... + "RTT"_n + "RTT"_0 + "RTT"_0 + "RTT"_0 = (n + 3) "RTT"_0$.
    ],
    numbering: "1)",
  )

= P15

The `MAIL FROM:` in SMTP is a message that indicates the sender of the email. The `From:` in the mail is not an SMTP message, but a line in the body of the message.

= P18

#solution[
  + A _whois_ database is a database that stores an Internet resource's registered users or assignees.

  + See @fig-1.

    #figure(
      caption: "whois query results",
      table(
        columns: 3,
        table.header([*whois database*], [*domain name*], [*DNS server*]),
        "who.is", "archlinux.org", "helium.ns.hetzner.de",
        "www.whois.com", "nixos.org", "ns-161-c.gandi.net",
      )
    ) <fig-1>

  + 

  + My school's Web server have multiple IP addresses: www.sysu.edu.cn(202.116.64.8, 2001:250:3002:10::8).

  + "Sorry, we found no results for www.sysu.edu.cn".

  + An attacker can use _whois_ databases and the nslookup tool to determine the institution's IP address ranges, DNS servers, etc.

  + It helps researchers, law enforcement, and network administrators investigate cybercrime or misuse.
]

= P23

#solution[
  Make the server transmit to each peer at a rate of $min{u_s / N, d_min}$.
]

= P24

#solution[
  "It turns out that if we imagine that each peer can redistribute a bit as soon as it receives the bit, then there is a redistribution scheme that actually achieves this lower bound." To achieve this, each peer's download rate must not exceed its maximum upload rate $u_i$.

  Let $ r_i = min{u_i, u_i / (sum u_j) times u_s} $ denote the transmission rate from the server to peer $i$. Then 
]

= P26

#solution[
  Alice is mostly correct. In BitTorrent, peers that contribute more bandwidth get priority when downloading. If Bob be a pure free-rider, others will typically deprioritize or refuse to upload to him.

  However, Bob can write a script to make his different hosts ask for different chunks of the file. In this way, each host appears as a "new" peer and can exploit initial generosity from seeders.
]
