local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.packed
  if not L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.no_exception
    if L0_1 then
      L0_1 = peattributes
      L0_1 = L0_1.no_exports
      if L0_1 then
        L0_1 = peattributes
        L0_1 = L0_1.no_security
        if L0_1 then
          L0_1 = peattributes
          L0_1 = L0_1.x86_image
          if L0_1 then
            L0_1 = peattributes
            L0_1 = L0_1.suspicious_image_version
            if L0_1 then
              L0_1 = peattributes
              L0_1 = L0_1.dt_error_heur_exit_criteria
              if L0_1 then
                goto lbl_36
              end
            end
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_36::
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 3145728 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_LOWERCASE
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\windows\\"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\\program files"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    goto lbl_75
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_75::
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "pea_enable_vmm_grow"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "pea_deep_analysis"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    goto lbl_100
  end
end
L1_1 = pe
L1_1 = L1_1.set_peattribute
L2_1 = "enable_vmm_grow"
L3_1 = true
L1_1(L2_1, L3_1)
L1_1 = pe
L1_1 = L1_1.set_peattribute
L2_1 = "deep_analysis"
L3_1 = true
L1_1(L2_1, L3_1)
L1_1 = pe
L1_1 = L1_1.reemulate
L1_1()
::lbl_100::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
