-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a38f_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_1 = (string.lower)(l_0_0)
  local l_0_2 = "net\\s+use\\s+(?<drive>\\w):\\s+\\\\\\\\\\w{2,5}\\.si@ssl\\\\\\w{1,3}\\s+\\&\\&\\s+(?:C:\\\\WINDOWS\\\\system32\\\\|C:\\\\WINDOWS\\\\syswow64\\\\)?rundll32(?:\\.exe)?\\s(?:\\k<drive>)\\:\\\\\\w\\\\\\w\\.dll,[\\%\\w+\\%]+"
  local l_0_3 = false
  l_0_3 = (MpCommon.StringRegExpSearch)(l_0_2, l_0_1)
  if l_0_3 == false then
    return mp.CLEAN
  end
  return mp.INFECTED
end

