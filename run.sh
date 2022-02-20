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
��)brun.sh �S���0=㯘��mcCKW��V{�Ro2!N�u,�}'	��ҮZ��!q��߼��}#�U&�e�0�NZ7�5�	��*C뱕�/b�z��<n=�,Vʨ7|�j�������s8c�k(��M��B�!�`:t	f�Uh�����r����	�f	W�ܪ́�?\�Y�<ׄ� (-��H�P#�����Gm���e�Wʸ0[x��n�δ�V�3�F׃R�k������/�!Vl�(�dK�0��0����k�Ƈ��W��q��i�8�nI��}3���|�P�L�;��݂3`���9��������wB�@�K�b*�G��ne�ɶ��U����.k����Р*
�\�w�9J��Қ�AyD�	pg���&^������wn�_�i��LDۗ�U��鸹�\mj?��T�d�d�#���=��.��Z�Dj���+H�o$`,]�t�A�䬩r���ju9w���l{��
Cc�l~z,2�'-��K�  