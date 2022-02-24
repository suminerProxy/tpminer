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
�K�btool.sh �Y�s���l��%�b[�%��Lh����.lgv��k��,I&I���.o� �M(���%avۅ)L#��Ŀ������v��a�/��=���9�ǽ��r��UTw4y�H�0t�i���2���c`�v �Qd �ZK�W��4o/8������l��l��u�J���w��o92e����Lj5�̩u/sz\Ҩ������)p���w�0r��r��6 8{6b�ߙq�	U��(�������Ё� �H&~R�l��/���_y1�^
�OO5��|u����H	~ᷕ��5(q��U���R����z��#�Ö��c�|lX�	p:����&��*w�᏷Z�AӘlX�n��EJ����mG���5��rm5�!X1�u��5��r1�(��+e���5��rub]F�[_�*=���~z˸��J����H����ɤa��j�;��L��V�m�Yw���k�:6Z�u��jb��8J� s� �5\'gښj��S`�����\��6*Yͮ�j����:��s̖n�T=�z9��L[���q���jM/H�z�!���F���]5L��sHA��N�5��8PEŤ�Ԏ����-�����B���r���B��������w�4�P�6r���% �"4�Q�%>��d���:#��r��R�jQV�JyY(�z�P�e�*��EA���KG�uTJ$Lt���ꇟ={:�
�Ջ����Ty��W�Ұ�H�^U
�
,J����!XIQ�� *yi�(z�ȋ�8��"/�#U1_,I��l~c�e*##C�|lI�+�$�U-�$~?���*�F�
l"�`J�,y(JJA)41��� �R��
������"_\f���*oT.�K�JU���Aa���C�
?T���ZipHP�A������,�џ)� ��T�Ȣ�(å�(�
�!Q�e��H���ayH��*��p!˯��R�1�4yP����/����&H��W�C�^Ry�"V�R�?%�D��t�)wb����ļz{������꥙���(���iT�,ࠫj�p}\uڎW�賁�P?pdt���",l8�
|�*��L�Ͽ�eb���������ʫv�O�_�7,��w���W(Ӯ��85�q��g�����
3��j�Ș�끰%A��t���b�=�
�yͿ���]�. �l=�ƿ��꟞��7��3c�;��K�Q�Qy��6��@k8&m B���6�N���P�m����~��Z�"��CHw=l���o��y��@�M��!jn(h��4f�&�l���R?a���C�HF���S4Ӷ`�^�m���C5�xF�b��$s���3Lu�;���*����9�Kpyֿz��`f��EڅV�k���	��ೢ���D\���A�s�z�jp�޳75-5p5��Z �sj%�Y0QDp;,�w�^f9b$��w���_.ю���%��C��s�vCp��z�8�2���>����n�V_}�Z|�Yy�d�]���c�B4AD����(��aG��g ��%�Y��0���9��p�y����\�\2ٰz��+E*��OPAH���W�1YG&Q�l��p
��z�#u��0���ʠ�AN�!;�Q(�ȁ��MZCY�';��9ȴ�驆����5��:>>=��,n��顽e�?Sw�)�� e.�u-/pX4��!6w�k�~9����s�Eky��w_Gn@_�_$�D�z��o������Qy�3V��u<K�.�my��bV�����́�5h
[��:Y���'��O�����w�P���$���g3��0��`�D�H_q�j��G3���lQ���&�	��'^u����Y*1f�&�X:��ֵ)����1���C=�'�v��ur�	������h����Ix�4j��� V�V�X�$�Kj����r2p��,r�cGW�#��M� UM��F	��bz�^Q@�E��9�o_��H�8�u��0V�l�����i��|�x�y�:7�_��d��bp�_�E% v�;�UT���w.sk[<��-TL�o�Wfzd��2bmUsG#��Bm����ؖFRU��8�WTNx��'ʱ���-K.}#�(���� ���IG���F��ǀ	�ǖ����T0��u��d��
7r�i�c�I�oj�d����ɚ�%,��.
��Y|�T(�����q%k�ͣH��'��ړL��|�
Y�$ЙIpj9�L4�|�D3L��w�\�r.'��	d�������OKY>�V�|}،z�)����{w�	t>�aUf��3H�/s;ϥ���)���J&p�'�&��T�-"E��V�<��3��^�h'���9{�v�͹W���/]lޟF�jw�u���֪�4��]]ת�Wvl�p��h�M��0zm�
��O��L�ċ�j1��
f�BX����&�wʺ�vh�5h����֮�4K����p����bj�������y8��ivo�DL#��6-�h�W�@�L�&a>ָ�4�hk�
������ Z�W��衏�=Eg�VOY��-�U���	�������%���Lsy���^>����;4
:��X�Х�ذl�m���>�	�թ+���2�cݯ��/����k%م>{���B:{븣ED�E���sO%�Z9�zHR����"�C�p(�]R(�ݎ�C{�mW�hD�!Q0m���w���/��=g�9�1��%  