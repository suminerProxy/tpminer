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
��btool.sh �XmS���~���1�Z��j��b�3$��3I�v&3�aV�Wh�ծؗ�g�8��:�m�j�ҴFL������+��B�޻�zA
��/���9g�}�9�>���ŕhFV��ȅFGAw�,��������ի �9�!��当���ڶ�i������W�ǫ�g흅����N�~eF6
�y)M	3<M*$g�� <8%�}���F(���Â�����E�NX�
x�9���~5���[�b���Q��h��/�l�;�_v����9������*���>|���Kۿ�X�i���"	�B��Pi�:%��`�AՄzA�>�Uk�@�S�w
��un���/;�~E.Zj�24�;"%V��uJ�.t�ڤX]6������k��#Vb�aE�r���X����F����`~:+-�O�g��ό�XꤪM�/�6+�B�j�������B =b���D��l�
u���5	��9��FT
�S�@�2������m�S g���htB6sV&"j�h^��YArH�riD�����iU�	����ƅ���Z�����f�9R���eeF�(
P7#E!�`
�� ����C��yl��r�mW6� ��vo�+����>ܠ�(�B�PA0 �t�U,s>����_�2�A�2�>a�E��IZ�&�B6�\,Τ$)�����,��d��S4�ݡ���_o��	@J�O��D\���p��p4/�Y��,���a�K] {& �����1n �2R*I�;$,�&cCY6�Lq��� �B~hh �� ��SL<+��G�GǸxR`RCo��-͝�t��A��|2!�1	!����)>�Ȱ٘D�X�a��/?s�x2�Jf�l\��g�21)10��	�}OL�0|���H��i^�p9\���j���R����]"|}8G��Auy�]���f�M��P��GAXTԝ}����G�M��ӏ���9�'_V�[գ�ɫ��/�9_�*�v��gNi�]�Bσ��-+�gMwD�,C�!TAX����2S�:�ۜu��d��z@W���6�碱�_��K{����2���ۍ�_`$D� \���F DKW��h�Q~R���@C~\W܄ϸ���=/��_?�������ҷ���+�v�jU��MԪhҹ*��(�H$B6FW��<���>\��G��ٕ����v�ǰ0��n��0"�́�{Mx�<�FMb!;��g�����:�ř_��R�^��|At~������ Z�=BGX��XLQ#�A�`�V6(Qjً�z����Yε@$�[*���1�1�q��/}8ShC_��;_�I���l�l�+{ m	g�}8�+�
ꔖ��g���\x���ګ��;σwN�0U����k=!NMm��5	��4̸�ge��l�L��6:O�*�����}����*�y(d���T0h�����FB{����s��h�=�6�� ���[��JڳV���t<-����]Q (�"�Z���4Y6V����)K6C]�jŸ+LO����o�٫W?��f���w�j�n��������P�s�#��з�����M�����GG���6P��VSJP�7����hX��(�W�}�҅�!+�[��>W͎��x
we |����N�X�Iz{��4������q��(JxV���9�md)<*]|�#��L�� K�h���/Q�1�X����d'�&WU�?��gRYפ�(��qF�����W��T�$Ra���ӫ.�_]R��sw�\�y����	8��yma�j�ӔG�x���%щ�r-kz�D�.�Y�bGF�e�>DVS����0F���r4M��7;�\`�E�������[HLR&�㯝G[Γ����=�J����o��k.����.�x����y2O���/��Q=��[|��e`j�P�q�$$�8�\�sz�{�4�A���(�Ol:t1���H��x��|�6�w8���%'���Z�X�/�P��z�?[[۱����{� ���9��:���ϜuYɜ?�Ẍs�<��eq$#U����w8|�dտn�|!J.t[J�[+�V_̵l���������m}��S.��˕����.��w���g�o�L85�|��z��]mz_\!��Ȼo��|�w�p����ެ�̻9�ک/M��Z��}�ƭ3��J���H����~J|�wiv��2�� �/�=K)  