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
��jbtool.sh �Ymo���,��Έ�,�H��&
`O2:�mg
$A@��a�T�R�k
�Y�8/�=����k��e^�XF�5^�?f&%}�_�%/I�X���`�"���s�sν�9��gG�eU˖E��<Se��S�H���Ep�(�REi�V����Vsi��u���o�ˋ���֣;��������+'�W�TPɤT��X�җ�E$U\6`�KWT@�j֙s�BKʪ�iCp�j��7~<m�*MxX�%�_������0�N&�~X��k蛏�p\�ޘw��Y����w����y}9ᬬ��lk������z��^��P�(i4�jB����S�4>�F��|/ֹ��K�k#Uu�����3�k6�1(���g<+�:l�EXV�]��3�kX�F:�X=k�x,V�Սu�6���Q�ӈ��ޏvf��	M��,ܬ�&��fZb�z,>M�Hu`�z5cV�O�V��j��c��.��S;�&����3 k�F��Kb�י�*�U7��f/�V�.g$����P��ƳA,�lU��iee}R�ꢌ�.U=Z�$��<ӏ���m���T7tE��EVfZ�U}����1t�����}Ϲ�Խ��|�9��k3H��z6����"E ���B�� U�e�����~y�DZۄ���9��𬨔Y��XJ��\^aYVahR�4%2�@��b��D`ZAf�����s�d7XjO�2/QI32)2e�da�,3$'	%�cDY��#��' K�	���8R�h.�y�D�O�=&�4ɔ�ܘB�x���`s{��s%ȍ�Q�X��qP�XE�qy�%sˋ�0vX`	��f��A�����蜌�g^���2��d2GsM���2~0��@Y>'�e�főj�����G�=*	#E�cG Z���3�B?��tTH&_fi��J�@�,��V��H��9f�/��"��o�p*C���R1�$v�e����XnT&%�a�7Rዬ,�$[��9������H�.
�q&�o���K˭F�p�Ƽ��u,|�zU�D��)J�p~����@���#y�8�2 ��",l��UT/P�p^|�����/Z��������O8Ϯ�_�4�9k�o�+7�҉��5�6�7S�t�̓
s ˔5����u$�ej����x���mgn= ��pn�"��|��w�?<w�:_�c�P��C�캌�3HOwDA� $ۨ� D��j�j�:��:�|ʫ�����ȟ �!�z�6O+�8�k�]G��q�?F��{���<�$�������;�C��F�0��'����*��#?��;t#���X�;I���c_�
�ký�kgn���-:�]ʁ�~�"��(˵s ��@��Afh�Gψ�P�C�����lE�$�-�}�64|5��� �5l��om�w�2�"q�ԩ r~��Z>��Zv�l���������Yx�jpo�s^���D�tW�[���U��V�W_�֞D�lo��Y��[�Ԑ��Q��w�#�J���휅u�m���x�>|�\��\���\�����D�d�����+E.9��� $�����'���ӨG��^
��x���~�<�`��a��M�-Bu��"@hF��^��N����� �Y�Wl��?�5�89�??]���h�T�&?��f�!�a<��shz��L{��fVz�ı=
A:�7Z���x���������(YoM����j�,��9c�e���R^�t͂�KXٚ��<H���S���V@?���O����֝��ب�C�B?~����0����p�}��-Ԣ9O�(��9$x��&^	����j�}���,��P�U��
� ����g��d��pX��ݫ���$���[�+��?��KQ�/U՚��9�f�
D@�~�2tG@B�L]�������	ёE����!UMMI!B�������H�!I�>k32�c�&zNUV��BcQӾm}��}��_o//:sߣ�lo��K��ZT�	�pQ�A����н?G�l�0wk��l�sn����z�H��]A�]��T��Do�i�cͧ�2�祀����>{�.���SgH��7R���.:{�;�qpk�n�!`B�8������qW^�n|�I-�p�$a���"ٻ��7f�Kk΋���� �ff�ˇHF{2�3��rH����;2���_(c�o��,���8$k��1:\��0�H�V���L��l����IuL�4���������!�>��\ñ�������S�=sӽ���TZ����E����p*M�q�E{tZ���v�7���e�emЙ��|���C�
����p(b�pD�w�$:�J>��A����竟pz   