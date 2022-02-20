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
��)btool.sh �X_S��Ɵ�Felc[�%��ę!�����&Cڙ�IF���Yr�g�nv���脴��M	)�6��m7���a��S�B��d��!��%S���9:�wι�w��/�$��,�f)v���Wd������(8{@���8T���`o���i����w�����R��}gk��~��媻�
�2�X��Ť���Ċ�S�`܀��P �Ԭ�W)����TLӆ���РM�^܀*MxX%��z�~u��#�s}Ī/�s��\ߴ]F�a���z�`g�]���g��Ok?���|���}�������Y6��%aP�]�Q�#P��k4*�bB��S�*4>�F� ����|���CT�i[�^���+Rbu�X���bw�}W��괱��"�!�}W���Ǌ��`%�ݱF�]��V����hVޜ�6��'÷��gƄ�UlmB�'C�'w[Tb1E3-QU���1��,]Wf	`
�*eE�ѕʺ�_NVM"*��A�6���K��m�o��eU����q�*م����eeEC,!}�ϥ�TE�VR�'5Ue�S=Z�r�kGо�[�-�H�*�^TT���(@�JL�e�PDͤ����R��C���{k���%��[3H^�v6����Uj�B(tB�A/ E�2�2Yz ��=(q$l��S�����b��r)���r*]�y�ȱ�YF��,Msש#B
���[0G�3#�,'�"W`i��GR6�
�(��� 3\�� �#p°@gVHqC6����2�(�4�Ϥ��l*���'�:@Z�Caxx�� dٔ �_�RB��/�)�ψLv�8 z��ܑ+��d9!-d���Q�4��d�t��S2�b��3�]�?re>��f
E���BJN�z(ͱ����#��՟?������˪E�KxV�|6��<�����<��K�B���3��V����B$'���R�Vѹm�Yp��M��_�R��4E)����nX96��#r�Z�5����π)0���4�j�8/�'s��U��Q߫�������Z�ɖ���~��]�'F�Br2� nA�J���[q�˔5W�A7C��B�LMS]�ϸ����m�@����M�_�C������������
������Ȉ�A|�)��lC%�#@K���bD�q��>��7j%eQCd�@�e ����}�,���`Y���>_G}��&m����"I$dc��^��G���E>�~�=������L#���;#�����# ��j�!do�w��̭�Xܹ%��c��؏�/�.Ȳ\�
|� +�V�h��	֌�)�4�
L�.%�m{�^������Z �4l�"�v�a̖t\�p�O������+��U��k�:�������;��y5�+�
�-8w�8+�J�}b/��o=�9���T�O�ֶ���8��	���$<O�����m����*��:D�>ި�ݫm�sv=��Kž��l�}n�����B��}�Xy���6�f,M��PT����-��$�Y+B��'���9vFaW�
�H���&��j
�ͽz�V,�Bv3o����9���OF.�X�s�Q�Y�����h}�u`(Ϲ�Bff)�z'���j����ޞ�o=�-��xÔ�����=-KuB�$��Sz@T�8� d�iI�,�Y]y+Y����@�r�5���V�,����a�Ā��[c8I��2����w���t�-�$�2!.<���G���t����A����&;�=���u=��z&U��-�3����0����?���| �
=�^�r���
�۽�k��ਤ����1U)+h��4���|
�#Lo?�N�W@`�Eh���:5!�tQ��$vd&<6@du��}]ƨvW��Y��)p�bW���q��|]yX�y��I������`�}��XYr�~D)9��r���zq�#ӥj�E�ז����S�e5�����B�oo�Mm
2n����&�xK�Mo��
(�c>���ѡÐ����u>�y",:�ޫwm�~�;r2P΂��Չe�d��Ѓ�����bù�"���43�]�2֓ᙳ)K!����#ܔq��Oف�G2R�,����#�	HV��:�p�������$������ٶMC�3�t���ـ����y�Cx{���Er�����r�ۘ�w���ώF�u��t�{T��+�_����X ��[��пě5��u~;���R�"a�߸M�
T�@�@��7OI��/������/����'Ֆ  