#let title = "Assignment 2"
#let author = "Langxi Yuan"

#set document(
  title: title,
  author: author,
)

#set heading(numbering: "1.")

#set par(justify: true)

#show raw.where(block: true): it => block(fill: luma(90%), inset: 0.3em, outset: 0.3em, radius: 0.2em, it)
#show raw.where(block: false): it => box(fill: luma(90%), inset: (x: 0.3em), outset: (y: 0.3em), radius: 0.2em, it)

#page({
  set align(center)

  text(size: 3em, weight: "bold", title)

  v(1em)

  text(size: 2em, author)
})

= Name Server Lookup

#figure(
  caption: "Results",
  image("assets/images/20251003-082945.png"),
) <p1>

From @p1, we can tell that:
(1) the IP address of `www.iitb.ac.in` is `103.21.124.133`;
(2) the address is provided by the DNS server `10.8.8.8`;
(3) the server is non-authoritative;
(4) the authoritative name server `dns1.iitb.ac.in`; to find its IP address, we can run ```sh nslookup``` on it.

= DNS Cache on Our Computer

On our host, the DNS cache is managed by NetworkManager instead of `systemd-resolved`.
Thus, to clear the DNS cache, we shall run:

```sh
sudo systemctl restart NetworkManager
```

= Tracing DNS with Wireshark
