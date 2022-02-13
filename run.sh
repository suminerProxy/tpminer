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
�>	brun.sh ��Ao�@��쯘P�����UT��|��s�z�-�a0+/,��6���;���zh9���{�����J,e&�A�0��&(����F�<�6�
u�'�{^�]m�Pg�\QE��u�l&cxg���a|X�C��n��@�<lC�^�0���$�1�TH%�	�rM����	��n�y!3��x�3�i�W�P �,ΞL�w�F�)�ѝ!��gO���2T�r�4����=|[(�U�E�F_o�I��������!�l�H��es�@���P�y�SÃ�-8]�`�ms�����n�~��%�8&:�LQ��P`�7�܆g�7w�?��O<M��)�D���T��	xUbAR�e��"��E��ZQ�'���l:�Cؾ��&��<ԩ(�~�g�3���t?y��C���)��28�޼4�A���$p9ғ�����J��0�L-�v�O=k�7�[���Hg�~�Ȅ^  