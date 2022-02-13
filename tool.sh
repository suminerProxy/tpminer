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
��!	btool.sh �XmS��l���- ��+i�J��LZä3��c�3���g�{�v�vžԦ3�����1nU���5b�4P�ǔ]I��z��ݕVH6��K���8���9��眽?��f�͊F>26��E�Atyqh|���R^CQ��Fm��踾��k����7�����j��{g��9��té��!��(&�G"RQfĒ��&QrhB�%�R�S��7n3�Ŧ�*�aa��'�B���Q�h���c5r���n��֍�~���t�����U�_/�l�;ٯ8k5�����Y�����O^> '���/��jZTx��D�`�]
�Xoa�/�hD5�^��՚A���1�{9q��z:w���.ڵ�
J�R{Ch�'R�u�XG���bo����X��Ec���������{b�ZV(���J�{c���J�ڱ�*#�(�>*�+����G���],uRզ��7�S"E5L�PD�� x��Qt�b-Cg�$��P�4K�;,;��y+��"[T&qN��<��^P� ��0YY�V�(��݂�/wŢ<ēm�|Q�������uS��<�vI�rJ�d��f�,DG�"t�b�ڛA㟏��-��v}�S���fA^�r.���p�d ��Ad	 @��� )*�����p�����*(fX�x���iNʥSb.��|2��rr(�J�r|��q".�\���;�\�W���@NKq�K�2'����#\��)3�xQ�	C�	8�g�	 �F �0*p�xBH��Ӊ���Is�xbT?�N���t�:'��	#X�n�L")�L<�������K�ό�����i��4k��7j5H�����]*|u8�t��Q"?��PTF��,�Y**��w�=B	��5d���5�擃����Q���wW����/���;�Ά��S��H����QTϡ��ZӐ��ːt�U-(��|
4!^3e�'��Y����®t�f/mPo?�=�M��/�Շ�g��
��3d�d`-�DU!����|�T�8)+z�ш��e7�3.U mE��cD6�O�կ�������bȔ���Z߮�'�X��󥾛z�[��p���Ћ�+�
���Q�a�7�x�n��7�H4z	��e��B3�憳�&���N}qV��'L���)9��;?�r�6��#�@Wr��%����Cs(�2L+�C�$w��^��]�L�X�RcF�{&����'/�%��J��S&be�*ḫ]��Ř���J�x���F[P��5{e�^�C�7��#�p�;��S��KO��m��UC͗�7v���$��r�ٵ�S��6�����ng�[�En)��h����V��\�^�V\���D~�Xj�D�Yp�^}\�/���<[ceh��6�vU�+�m$�K��J�S[�D;�=�:1�SF�Ƞ����f����E[	=e)fH�ovive�qt䭷T[��7����~o�}=lo�n�Yj�5������1�<n'��6ᳵ'	�E�3jEo�ރ��)NjW�B)?2�?�lBf��|0_x���@�|C���BE=f�~��#�	����8�����Q���g|��Z�#���\�y�'����	�E��P��0�U6�}��7���r&Rɗ��]d`���CF�%�A��)�����❦P>E9�A���f`�`,3�/ ���a-h�=��/��[�����������x�Y�Pq���Z@�@g��'�����A�F�;zd/V:l��M�jW@���Ky,M���[�H�f!�w�ʥv�RG/ե�3����vS)*�5�p��S=h����0�̏�N5���0�p����6�v�-{~�_C(���9�0�%\�Z�$Ȝ?|�֒�Gp�,2z�-ِ���/@���&̭�6�^�u�@�:�x>ב44>�-Siiy�`��j�g\�����}؃s��Xsv�Y��X<��su�qy�J���n*�˞�C��{w0m�� 䩐$�/Kz�!鐯��|�0�%n����������񭷪�_��i�~?�;����o  