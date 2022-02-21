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
��	brun.sh �SMo�@=��b���Z�B�*匢H=�=�W,^g�|	���1������ޝ��f����w�Qd�1,Rf����2����v�R�1n߹V���"�%�2�E�]H��������4��`�
�+(��u�����0�3�*$RJo�Z���3K{�`�p=��]�Ef���g�U6<����)-��H7x���n�T��#�6�p��?�2*���A7���J�-7�p����|�����l�_�!l�
�$K&0�X1��7B����K=o��s��朇Y����1��g��Z�����O`����� 8�ĸ�E�J��ĝ(4��D�b	�ļ�nÅ$ٶ�,��<�"��m𤂶Rc��o,^�,�KW�8jD����f���F�1����/��7c��[��I)���*�/�Y�w:��S �G��s)��e�/��D6
M
�:��fm�᪦��P���;�l/�z��=���(-`1d�3ouY�2d?4�\�  