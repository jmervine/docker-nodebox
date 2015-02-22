from string import Template
from optparse import OptionParser
import os
import sys

# simple script to generate Dockerfiles

maint_name = "Joshua Mervine <joshua@mervine.net>"
image_name = "jmervine/docker-nodebox"

parser = OptionParser()
parser.add_option("-n", "--tag", dest="tag",
                  help="required docker build tag", metavar="TAG")

(options, args) = parser.parse_args()

if not options.tag:
    parser.print_help()
    sys.exit()

options.tmplf = 'Dockerfile.tmpl'
options.tmplob = 'Dockerfile-onbuild.tmpl'

tmplf = open(options.tmplf, 'r').read()

# Dockerfile.tmpl
data = dict(
    maint=maint_name,
    name=image_name,
    image=options.tag
)

fout = os.path.join(options.tag, 'Dockerfile')
out = open(fout, 'w')
out.write(Template(tmplf).safe_substitute(data))

print "Generated: " + fout
print "     from: " + options.tmplf
print " "

# Dockerfile-onbuild.tmpl
tmplob = open(options.tmplob, 'r').read()
data["image"] = data["image"]+"-onbuild"

fout = os.path.join(options.tag, 'onbuild', 'Dockerfile')
out = open(fout, 'w')
out.write(Template(tmplob).safe_substitute(data))
print "Generated: " + fout
print "     from: " + options.tmplob
print " "
