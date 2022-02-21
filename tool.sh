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
��
btool.sh �Y�o�����+.��]$�)�M��dt@��H��"�a�TH������q�8�g�3�i����2ڮɒx�cfR�O�v�#)Q��$��C0�b����{��ϝq([��lYv*�3g��]��(8T 48w>�R�@��x����\ݰ-�������Jkg�uy�u�r�;��?)�ɬ�&�R�j��knz
�TJ���k ]���W�tO��@�JVw�:/�
=��mh@فǀ[�fj���ӿ�<Y!Z#��SF��U��R��K�O��Նc����ݳ泻/��@Nx��-�M�N��O�7(�-�$�I���d�L�5[w x_7��4�?�� '^��M�Wz��]3���98��H��Ac���e˃�&�b%Z��˺���&�b%Z!V��+Q�51>+��ƺg�N��Q���3B��>2��R7�Mk&���f5=��MǕ��(�$УԀkYFƩ \��ZU7�M�*UK�/g�͠R
�N�lݱ����֙� *�[s��f�t�R/g�����P�m��Ƴa,��!��q��5c�����FP���U5��"���V]��$�lK��Q��A����U��PFͤ��#�=���[�������H�h_�G��W�ˋ�w�Q
��,�!�D t˂G%z4�<(id��' ,���YA�M�e��C.�3��������*d��%���R/qi�˸��~� Dϱc�p�}᪢�4˩�̕Y��%��т"�X��UMȏ	P䤟.�/\N�h�a�W��J"�2�,�4Ws�%.�����7/��01QD!Dp%6'@��5%'�9z��q�(3����B8�}q�d9!/�y�ͩh5�y^%!�/�ZN�s����x�8�}q�bN���cc�D9��%�.�9v\�Ɗ���A�n��řE�	3�5�˗yV��$�<ϠVd��E��%�(��������i���с�~�����Dn\������E^�d�/��TD�S"���!}'�o��H�n���T��W��?n��T��YI����tʲ�+�g��"�p�U@e�sF��(p.$	hAOA��{�-i%�O?o5����~8�}}��r�yo�ۼ�{�_�J���]Ȯ������:'�`ԼCX�bCh���;.�hb-.�ev����������Vt��]�@@��4����z���>_"����љ
�k*j� =���(u� $!BK��Ӫn'ME~
>�i������� ���d�#���������-�����>"@4�C͍%�I&�!ch��!���.�!�H�2a?>��1�SA�#72�I�:&=	Ц�3L|!+���Z�½�5⋿��]�Ku)������EQV��Ah�2j@�F��$��X�#�?�[�4@)j�Z|�φG�"&�Jd�v�D��cG�+ǏÇ#����Κ�E�P��?��}o�1@K¿z�{>�3��/y��ykz�]��Ͼhm>���}��
�S7����ĨkMC�;'�~���`�,o�`�-7���as�zs��t9(W�R�OS���K�c��\�V�Fe!��j�=m��Cdڴ�lh�<�U�~�I���(��;�A"ul�¦(P ��i+)�#�[,���Hw�ꅺ��W7�<3F>�<Q`�p�x��?�ٺ�a��2
��� C��Rs*�����>��[z���ǻ�`W�@��������ptM�u���ǢBe�3R���X�Mw`��Ve|�d }r����)c�*}���S� E�*>��<D\ӧ2s!�x��Jo��cJN����"vރ%"@��J����������G�u�R64�F���ƪ{�����c���d8�ax�Z��W���{��]X��{�Tds
�7����0qάWTX1�>B�S $8��� Ã���Ew�ؐ�	��(*V�=2�F���r4M�'ڌM`�sT�t`���� ���{����-��B�������hPLWqAu��z׿�H�ey�.��Ql��.���e�ZǮ �.&�T�2�L�+Z�X�e���y>�E�-u�t�J_��u�>���4�T������֕o��@1�"�f'��7{�Tr��>�o�nz�z�Gc 0��_Oױ�d�svd9$���=���%;��HF�ܑ��psD2�Z��������'%G���z��hǔ@�܀$����� �����$�Oz���p�ߞ��_��&-�K^��^އW��+^�7��I,��W�]WHޟ���»ʰ�F�|�i�"�0.�N劆�h(�RшY��h(�4{��2�� �3�k  