gvariant.el
===========

This Emacs package provides helpers for GVariant strings.

GVariant is used for the Gnome configuration system, GSettings (and in
various other places in the Gnome software stack). To interact with
GSettings from Emacs, use
[gsettings.el](https://github.com/wbolster/emacs-gsettings) instead,
which builds on top of this low-level library.

More information:

- https://developer.gnome.org/glib/stable/gvariant-text.html
- https://developer.gnome.org/glib/stable/gvariant-format-strings.html

The only public function is `gvariant-parse`, which parses a string
into an elisp data structure.

``` elisp
(require 'gvariant)

(gvariant-parse "uint32 12")     ;; returns 12
(gvariant-parse "('foo', 123)")  ;; returns '("foo" 123)
```

See the unit tests for more examples.

License
-------

(This is the OSI approved 3-Clause BSD License.)

Copyright 2019 wouter bolsterlee

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the
   distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived
   from this software without specific prior written permission.

This software is provided by the copyright holders and contributors
"as is" and any express or implied warranties, including, but not
limited to, the implied warranties of merchantability and fitness for
a particular purpose are disclaimed. In no event shall the copyright
holder or contributors be liable for any direct, indirect, incidental,
special, exemplary, or consequential damages (including, but not
limited to, procurement of substitute goods or services; loss of use,
data, or profits; or business interruption) however caused and on any
theory of liability, whether in contract, strict liability, or tort
(including negligence or otherwise) arising in any way out of the use
of this software, even if advised of the possibility of such damage.
