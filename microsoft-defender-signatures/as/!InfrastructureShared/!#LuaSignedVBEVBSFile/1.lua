local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = "none"
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == 1585332259 then
  L0_1 = "VBE"
else
  L1_1 = mp
  L1_1 = L1_1.readu_u32
  L2_1 = headerpage
  L3_1 = 1
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == 1667594309 then
    L1_1 = mp
    L1_1 = L1_1.readu_u32
    L2_1 = headerpage
    L3_1 = 5
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == 677737589 then
      goto lbl_31
    end
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "TARG:VBSWithExecute"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    ::lbl_31::
    L0_1 = "VBSExecute"
  else
    L1_1 = mp
    L1_1 = L1_1.get_mpattribute
    L2_1 = "TARG:VBSWithConsecutiveV"
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L0_1 = "VBSConsecutiveV"
    else
      L1_1 = mp
      L1_1 = L1_1.get_mpattribute
      L2_1 = "RPF:AnyFileHasIOAVURL"
      L1_1 = L1_1(L2_1)
      if L1_1 then
        L1_1 = string
        L1_1 = L1_1.lower
        L2_1 = mp
        L2_1 = L2_1.getfilename
        L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L2_1()
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
        L2_1 = string
        L2_1 = L2_1.sub
        L3_1 = L1_1
        L4_1 = -4
        L2_1 = L2_1(L3_1, L4_1)
        if L2_1 == ".vbs" then
          L0_1 = "VBSWithURL"
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L1_1 < 12288 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = L1_1 - 12288
L4_1 = 12288
L2_1 = L2_1(L3_1, L4_1)
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "'' SIG '' Begin signature block"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L0_1 == "VBE" then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:SignedVBEFile"
  L4_1(L5_1)
elseif L0_1 == "VBSExecute" then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:SignedVBSFileWitExecute"
  L4_1(L5_1)
elseif L0_1 == "VBSConsecutiveV" then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:SignedVBSFileWithVBSConsecutiveV"
  L4_1(L5_1)
elseif L0_1 == "VBSWithURL" then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:SignedVBSFileWithURL"
  L4_1(L5_1)
end
L4_1 = mp
L4_1 = L4_1.UfsSetMetadataBool
L5_1 = "Lua:SignedVBEVBSFile"
L6_1 = true
L4_1(L5_1, L6_1)
L4_1 = string
L4_1 = L4_1.sub
L5_1 = L0_1
L6_1 = 1
L7_1 = 3
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 == "VBS" then
  L4_1 = mp
  L4_1 = L4_1.get_parent_filehandle
  L4_1 = L4_1()
  L5_1 = pcall
  L6_1 = mp
  L6_1 = L6_1.get_filesize_by_handle
  L7_1 = L4_1
  L5_1, L6_1 = L5_1(L6_1, L7_1)
  if L5_1 == false then
    L7_1 = mp
    L7_1 = L7_1.UfsSetMetadataBool
    L8_1 = "Lua:SignedVBEVBSTopFile"
    L9_1 = true
    L7_1(L8_1, L9_1)
  end
end
L3_1 = L3_1 + 31
L5_1 = L2_1
L4_1 = L2_1.sub
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
L2_1 = L4_1
L5_1 = L2_1
L4_1 = L2_1.gsub
L6_1 = "'' SIG '' "
L7_1 = ""
L4_1 = L4_1(L5_1, L6_1, L7_1)
L2_1 = L4_1
L4_1 = mp
L4_1 = L4_1.vfo_add_buffer
L5_1 = L2_1
L6_1 = "[ScriptSigBlock]"
L7_1 = mp
L7_1 = L7_1.ADD_VFO_TAKE_ACTION_ON_DAD
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
