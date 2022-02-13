#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�� 	brun.sh �SMo�0=[���4�f)�[�Ӏ�{(�CĎM�Bdɕ�| �m'M�n���%�=����b!�X�UΒ*[�w��.�5�T�S�\��M|a�q��h}V[uu&ZK���g�љ\�G��P�Lf�A�� �찴X��A���{�$��a���Q3�RH.�1�J�N����	��
n����A0:�D�k�!(GrKD�'���-�t�s�A��@�'���t0TJ�	`���C>|�6WR��y\�_o�I~�����+��_�C&�&��!YF0�1�����ޫ7>5z�UN�Y��A����C�ܻ�B�!���e&�H�������8�><����C�+����I���41�vO��
-A�y\��_�A�j�������A7�Y"%pgV�'S?w$�w!�����'�U}i���S��l%���#ml�VS���N7�5J���Yj4�_���	@  