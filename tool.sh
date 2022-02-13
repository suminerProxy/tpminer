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
�>	btool.sh �Xmo��l���E�D�$�o:Ҷ���H`�n� �`��A�;�^"�Mɍb���
�m��q\Y��֢���*KՏ��H~�_���ݑG���T@��Q������<;�o]��$%���Bht�H"��atq�hl��6�BAE��Fm��𨾺���a��w͵���J��k{��1��tݮ��!S�%�C!�(1|Ɉ�c�	Iy4���OJ�y+ƍ��aC�I�nb��'�B�����e���*2
X	]���ۿ�uc��j��.��p��l��������*�j�~0k�xV��e��W�	������&�-R7�K�c9�������k%M�1�@R�itkc�����ӹ[�pޮ�+KeS���H��yc�����{b�Z��:�I�k�j�X���+U�50�+�j�z��x����th��W��V1�	E��-��l^
�$E7xY�߄|B	�*G�"l����5:V(�"�6}rh
�E&o���k1Yx��'Q�0J��Xl\2
f.*��XQ��y^�0sc��d����)EVy���-���`�A�:d�PM�@7���yI�Q1jF��e��a�b��ϐƿYs���������hޛy��Y�ǫ�u&� 
U�!� 9�$)D�|\&ˆ���"�P�Ա6������2��Ϥ�|.�S�t<+���|:�Χ��q>�fY6u�y�K�w�j;���!α����\�M�a6�b9!;��R�����p&�=#�������\2u=������'Fx>���3ɑ|"�ɦ� �f ��0�FF���  �Hr8O�$7�b�&S�ώ�����Zi�5W��$U�~����:�e���:/�@[�(""&�:^�1h���JNZC6[�_�l>���Q�l֎_~w�z~���Z�mm��_?��T�_ZE�<�X��D9� ��tA�XAY��1'��.3=�m���\��w\�+5kq���9h��o�|a�<�>�P�]P��}��!�$��H�%r	�&S���R��(iAGC�_��O;T�U� ��Y8t��_Y˿�?��`��p0M)��UO��(��}7?t������gG"Ȫ��Q�n�7�x{nD�A�Z$��8��2L}�Bs�^t֚_����+���M���l��e�x����2�a�	=������,�|�t���#��x�i}�w�0>�јf*p��`�đ��
$4�t!�J^���2�Q�P'�n�k�ܠ��B\n�ٟ��T�{�Zް�w$����:�!y i`W+��SkmK*]�j������3���~"�����15J@\a~4v�x�pΩ����r��]�i?٬W��[K����8����oC!S�lH��"a�<�Ǭ�/�k�\[�ehu�9�Q^�����רϑt�� w�
�<ub�!�4�X�A5(:!9�������
cҔ��V7��r�X����;�^�m��������I���ݥ���Q{�6�c/���RsNdH2n�=�,V�I���P�F�5(���v�.���!���DJ��$��@�U��	1��&�G;{��}�����4&KGмY�*Tԣ7��gݲ���k�Gn��8��,Ĉ^h�=�'����9�A�^�V�!�^�pa/J���b����	�7@a�q"�t5o ����J�ЦKF9F�Q���P������q�w�Bq�Ҳ,��y��M��Xf7	�s�Ø��h ���nڏw�k+��w��m{�_@u�e�#Vj>9��W�؏癓M����P��t7��I\�^(`a"���زF�6��V��(<K��&�D��L�h���t:0ԚA�ēuST��PD�"j[E�yޔe�]X�`Ʈ�7�E�v��1�C5���1�`���4W���Mkn�C(��̬{7�e	GF���,	2�O�B��d)GϥLO�͛�l��s�͓q k�u:a�NF��:6y�Y�i<��HC�p�TƁFQ�*]m1��<��q�R?ܦ��p�h�x�k�,�K�G�c�'���7��˽C��G�ʿ[xr�y������d�{	H=M�䉸�[-2�2ސ_��Hֳ�*<o�R�%�4OG0�<�gK�zA  