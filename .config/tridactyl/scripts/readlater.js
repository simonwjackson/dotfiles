const d = document
const z = d.createElement('scr' + 'ipt')
const b = d.body
const l = d.location

try {
  if (!b) throw (0)
  d.title = '(Saving...) ' + d.title
  z.setAttribute('src', l.protocol + '//www.instapaper.com/j/61wOjZJi1dut?a=read-later&u=' + encodeURIComponent(l.href) + '&t=' + (new Date().getTime()))
  b.appendChild(z)
} catch (e) {
  alert('Please wait until the page has loaded.')
}
