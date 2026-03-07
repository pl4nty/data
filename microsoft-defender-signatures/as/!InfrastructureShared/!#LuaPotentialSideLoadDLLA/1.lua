-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPotentialSideLoadDLLA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.PathToWin32Path)((mp.getfilename)())
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0)
local l_0_2 = {}
l_0_2["program files"] = true
l_0_2["program files (x86)"] = true
l_0_2["windows\\system32"] = true
l_0_2["windows\\syswow64"] = true
l_0_2["windows\\winsxs"] = true
local l_0_3, l_0_4 = l_0_1:match(":[/\\]((.-)[/\\].-)[/\\]")
if (not l_0_3 and l_0_2[l_0_2[l_0_4 or ""] or ""]) or l_0_1:find(":\\programdata\\microsoft\\windows defender\\platform\\", 1, true) then
  return mp.CLEAN
end
if not (mp.getfilesize)() or (mp.getfilesize)() < 256 then
  return mp.CLEAN
end
local l_0_6 = nil
local l_0_7 = ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).RVA
local l_0_8 = nil
local l_0_9, l_0_10 = l_0_7 + ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).Size, (pe.get_exports)()
if l_0_10 == 0 or R10_PC74 == nil then
  return mp.CLEAN
end
local l_0_11 = nil
local l_0_12 = {}
for l_0_16 = 1, l_0_10 do
  local l_0_13 = {}
  -- DECOMPILER ERROR at PC87: Confused about usage of register: R16 in 'UnsetPending'

  if (pe.mmap_string_rva)((l_0_11[R16_PC87]).namerva, 64) and l_0_7 <= (l_0_11[l_0_17]).rva and (l_0_11[l_0_17]).rva <= l_0_9 then
    (table.insert)(l_0_12, (pe.mmap_string_rva)((l_0_11[R16_PC87]).namerva, 64))
  else
    if (pe.mmap_string_rva)((l_0_11[R16_PC87]).namerva, 64) then
      (table.insert)(l_0_13, (pe.mmap_string_rva)((l_0_11[R16_PC87]).namerva, 64))
    end
  end
end
if #l_0_12 == 0 then
  return mp.CLEAN
end
local l_0_18 = nil
-- DECOMPILER ERROR at PC128: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC136: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC144: Overwrote pending register: R13 in 'AssignReg'

if ((mp.get_mpattributevalue)("MpPureForwardedExportsAll") and not (mp.get_mpattributevalue)("MpPureForwardedExportsPresent")) or (mp.get_mpattributevalue)("MpForwardedExportsPresent") then
  do return mp.CLEAN end
  local l_0_19 = nil
  -- DECOMPILER ERROR at PC161: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC174: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC176: Overwrote pending register: R14 in 'AssignReg'

  if #(mp.enum_mpattributesubstring)("MpPureForwardedExportsTarget") <= 0 or #(mp.enum_mpattributesubstring)("MpPureForwardedExportsMissingTarget") > 0 then
    local l_0_20 = (string.match)(nil, "ForwardedExports(.+)")
    local l_0_21 = "PotentialSideLoadExports"
    AppendToRollingQueue(l_0_21, l_0_1, (string.format)("ExpCount=%d__FwdExpCount=%d__LocalExpCount=%d__ExpType=%s.%s__FwdExpNames=%s__LocalExpNames=%s__Size=%d", l_0_10, #l_0_12, #l_0_18, l_0_19, l_0_20, (table.concat)(l_0_12, ","), (table.concat)(l_0_18, ","), l_0_6))
    ;
    (mp.set_mpattribute)((string.format)("%s=%s", l_0_21, (string.format)("ExpCount=%d__FwdExpCount=%d__LocalExpCount=%d__ExpType=%s.%s__FwdExpNames=%s__LocalExpNames=%s__Size=%d", l_0_10, #l_0_12, #l_0_18, l_0_19, l_0_20, (table.concat)(l_0_12, ","), (table.concat)(l_0_18, ","), l_0_6)))
    ;
    (MpCommon.SetOriginalFileName)(l_0_0, (string.format)("BM_%s", l_0_21))
    do
      local l_0_22 = nil
      if (MpCommon.PathToWin32Path)((string.match)(l_0_20, "=(.+)") or "") then
        (MpCommon.SetOriginalFileName)((MpCommon.PathToWin32Path)((string.match)(l_0_20, "=(.+)") or ""), (string.format)("BM_%s_Target", l_0_21))
      end
      do return mp.INFECTED end
      -- DECOMPILER ERROR at PC252: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

