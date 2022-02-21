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
��'btool.sh �Yms���,��3����$ ���TR��$�Gng2c{< p1" #�qf$7��Y�Xn#W����jZ��$�U۪~L��俐� i�N������޳�w�ϝ~u(]ԍtQ�K�3g��]��(8�48w>�R2A�Y����XݰL�������Jsw�yy�y�r�;���)�ɬ� &�P*j���Nr
:TB���� Y���7�pN��@:JZ��/F
]��$-X������P���7y27B�FC�>ȍ��*�㥼;�����պwc�{�����Ƴ�/��@N���/��F�{�׈�� ��8�I���dZUK�!x_7j��4�>�V?'^��M�WxЮ������?��H�֠�N@մ��Xc�}��Ac�â.�$���X�V�m��`%������b%Z�X�m#ٮ�<*]�wF���GƆ�Yjƴa�D��ܬ�'�a;r�|d|� �Q��1�r�.\��jE7�E�JS�g�͠R
�N�tͶ�eS��Xg�(9N�~7��ҝR��R�J��OCM��O���eف��V��l�*;_���y��f�n���qǬ)%���ejz��4r�rRsr��u,(�fR������-��C��F��g�s�.�#y㫅����;�(�P�&J���a" ��e�#�=����R5Z��R�� Ҋ&�V�!��IU3Y��y�ci����Msg���4�a\C��@ ��رN�́pUQa��TZ�,��]�hA�
��ɪ&d�(r�[���&ZbX!��E����H�;!�,��̄�fD�˾����f�&&�(���f(1��d�,G���eF��!��;g��@����U،�V��%Q��"�eT:�
K������3�X�X^c&�5�/t>˱�4�g~�u�gv���tb�h.[�YA
���<�vX�eh�n\,���狯�s&E��F�"S�1�Ϗ�K�q�V�Co�&�yU�i��3RQ�ω��B���x�I�#%���֬�Q�n]Y���E�/�/P��#�e%1`�;�)�rr����8��T���a����Ġ�=���7���=��Y�ܩ�=�������z�ަ�y��枷~�(���UIK]3�O0�<�y�lł� ɲn; �-��8ȗ�9�/�������[Е�{m��Ѹ��m�屻r��|�`��Fg*P������\[��Ԭ2!	!Z�T�Vu+�h"���Y�O#�P�Ե?�E�ƃ�����?5nn!D����"�	jl,!OR�YCç>��p��ag_��M��3v#?��;t#�w��`�� m����B����+�]\#�x�+T�r�)N_�]e�r� �e���b혲�"zD��G�vj�(E�Z������YĄ_i�Tڪ�s��a�cw�����A�p�Ђ>��]�j��W�]��.?hIxWo���qFQB��%��=wmC��K�@�����7{�Oq�8J�9$cXԜ��9���,��gy��l�N(x�����ݧ�~��J|�HԌn��W䒻����]���� �uf�i�<�U��婎��0�KzW�XA�����cc6E��ЌH�q�>��bٙ�@��V/�t�􏨺��i0���{�����s,�I��3����@@�_�F �7�[���]��ޫ��h5��vsg'�܃%��3�KJ��׮����1U/�ib�}�%ϤH��;�b4��u+]���Η����s�J���u���B����� )rX��W�q �(��>��x�[�R>���rwn��\�Ja���K>�$�4.�A��"b�>X"�>4h@U◿��J�<Ϊb^,eC�z���fD����:������r@"{޽fu��j@	���ޅu��߱WJI6����^��&��J�
J �0�G�w
����`�`p��!:���\�S~5E���G�ШnS��Y��)p�D_��	�q����|�>�Bc����v��n>�no��V���QH�v7����,�8�ӕz�EP�o���n/R�Y��j;�ܫK]�}z�ְ+H��	)%�L�����p*�x�jQtK'���$i���nlB�U������y�k�3P��ىf��*_�{���M��C��p ����t�X_�9g[�A2�ߡ-ܖq�^P�C�d$�mY��6G(����������ɿ	�Rr��>�|�еhH|FۦD�$�=m��%����&�}܃7v�����U��?�0I�\����>�N\���(�i�Nb�<����B@���/�P�U�4�fCM����`�+W8$�Cі
G��z{��C��٫_��o�ُi�;  