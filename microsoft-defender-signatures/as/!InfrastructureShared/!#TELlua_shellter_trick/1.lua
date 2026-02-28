local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
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
            L0_1 = L0_1.dt_error_heur_exit_criteria
            if L0_1 then
              goto lbl_32
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
::lbl_32::
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "TEL:lua_codepatch_shellter_trick"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "TEL:lua_shellter_trick"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 5242880 < L0_1 then
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
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
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
    goto lbl_89
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_89::
L1_1 = string
L1_1 = L1_1.find
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1 = L2_1()
L3_1 = "->[ShellterEP]"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = false
L2_1 = 0
L3_1 = 1
L4_1 = pevars
L4_1 = L4_1.logsize
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = opclog
  L7_1 = L7_1[L6_1]
  L7_1 = L7_1.value
  if L7_1 == 96 then
    L7_1 = opclog
    L8_1 = L6_1 + 1
    L7_1 = L7_1[L8_1]
    L7_1 = L7_1.value
    if L7_1 == 156 then
      L1_1 = true
      L7_1 = opclog
      L7_1 = L7_1[L6_1]
      L2_1 = L7_1.address
      break
    end
  end
end
if L1_1 == false then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = pehdr
L3_1 = L3_1.AddressOfEntryPoint
L4_1 = pehdr
L4_1 = L4_1.ImageBase
L3_1 = L3_1 + L4_1
if L2_1 == L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = check_expensive_loop
L4_1 = L2_1
L5_1 = 384
L6_1 = 196608
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = check_expensive_loop
L5_1 = L3_1 + 2
L6_1 = 384
L7_1 = 196608
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = check_expensive_loop
L6_1 = L4_1 + 2
L7_1 = 384
L8_1 = 196608
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.readprotection
L7_1 = false
L6_1(L7_1)
L6_1 = mp
L6_1 = L6_1.readfile
L7_1 = 0
L8_1 = mp
L8_1 = L8_1.getfilesize
L8_1, L9_1, L10_1, L11_1 = L8_1()
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
L7_1 = mp
L7_1 = L7_1.readu_u32
L8_1 = L6_1
L9_1 = 61
L7_1 = L7_1(L8_1, L9_1)
L8_1 = mp
L8_1 = L8_1.writeu_u32
L9_1 = L6_1
L10_1 = L7_1 + 40
L10_1 = L10_1 + 1
L11_1 = pehdr
L11_1 = L11_1.ImageBase
L11_1 = L2_1 - L11_1
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.vfo_add_buffer
L9_1 = L6_1
L10_1 = "[ShellterEP]"
L11_1 = mp
L11_1 = L11_1.ADD_VFO_TAKE_ACTION_ON_DAD
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
