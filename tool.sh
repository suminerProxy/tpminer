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
�-@	btool.sh �Xmo��l���E�D�$�o:Ҷ$��H`�n� �`��A�;�^"�Mɍb���
�m��q\Y��֢���"KՏ��H~�_���ݑG���F@��Q������<;�o]��$%���Bht�H"��atq�hl��6�BAE��Fm��𨾺���a��w͵���J��k{��1��tݮ��!S�%�C!�(1|Ɉ�c�	Iy4���OJ��9V��Æ�t���O|���K˘��Ud��p��y��P?��]���P�,�/������U�՚�`�~������'��Vu�W9S1L*<�[�n00��r�-,��y+�J��c􁤘��6�>�Z/'N9��s����]{W�ʦ�{�=�R���:�EU�{c���J���u�����50�+�r�B!�V��k`�'V�Վ�D�z��Q���]���V1�	E��-��l^
�$E7xY�߄|B	�*G�"l����5:V(�"�6}rh
�E&o���k1Yx��'Q�0J��Xl\2
f.*��XQ��y^�0sc��d����)EVy���-���`�A�:d�PM�@7���yI�Q1jF��e��a�b��ϐƿYs���������hޛy��Y�ǫ�u&� 
U�!� 9�$)D�|\&ˆ���"�P�Ա6������2��Ϥ�|.�S�t<+���|:�Χ��q>�fY6u�y�K�w�j;���!α����\�M�a6�b9!;��R�����p&�=#�������\2u=������'Fx>���3ɑ|"�ɦ� �f ��0�FF���  �Hr8O�$7�b�c��t��gG��RpuZ�4͚�k�Z��y�b�a�
_�2�la����QsZ��4��P`%'�!��ݯi6�֨m6k�/��l=�gQ�?ݶ��������t�/��"Zu��j��u�?\X��a���,���ӀxM����6f�-Y�;.Е���@��4��7�?��VZ�U(�.(��>h�Y�EP����S�)Oyh�RqB����!ϯ�N��� �*�
���,���կ�����p��b8����\ߪ�'�h��󅾛��[�{p���Ѝ�#dU��(U7	�N�=7�Ό�c-��B�u�����a/:	kͯQ_��k�	Ӧ�zJ���΋�X��\���QC��фP�|U`hE>B�a��Ď\<մ��;p�j�hL38���a�H\o�����T%/�G�E��(j�X	��ڵkn�I|�.7����k�L���f-oX˻�^xd̐<�4��k񩵶%��P5�|�yc��?�xo?�������u��% �0'��G���ڝ�9�T�w�S��5�qt���d�^]�o-Y�����gB��L���Ok���(���l�=sm���wP�1�pFy�o��_�>Gҝ!\��*���ԉ1��b�b`EEԠ��$1�g�G(Ҫ�IS2Z���ibU����x{]���q"Kh�������v��:F���D��4~*J	�9�!��4��X�'-�#C��נ�v���U�0�O��N�R��ɬ�$mU�c� �<؄�hgOy�Mq��q��d�z7�Y��z�F?�L�[�!~��p*��?1�7f��I���s�t��׳U��_��B�W�1�׋l8E���!ƭlr��Pb�H#]�H!�{��1t�Q�Cz�!�0��$�g�{�❦Pn�,ˠw��i�7A0���E����0��=��/쇛���ڊ5�-���h�^������p�J�'G������<s�ɠt� �>�*����W5�+��v�,L7��[�H�� �w���߄�g�[�䑈<�)�=n���N�Z3��xr�n��{�hBTDm��8ϛ���l���������hQ�.x1����>&��㽙�궵�i��zc��33�^M}Y��%K����?�z[����R�'K���MK6�����8�5���0y&��|�<Ь�4��v�!�O�e*�@#�(M�����[�~ց8W�n��]8s�{<�5g쥿��#ٱ�\������!B�����-<��:�va�
I�y�tؽ�����Z�D\�-�zCoȯRo$�Yo�7t���u��#�C^��K�Z�@  