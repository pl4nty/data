-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e1d75aa6c996\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
local l_0_4, l_0_5 = (MpCommon.StringRegExpSearch)("-w[indowstyle]*\\s+(?:h[iden]*|1|minimized)\\s+", l_0_3)
if not l_0_4 then
  return mp.CLEAN
end
local l_0_6 = false
local l_0_7 = 0
local l_0_8 = ""
if (string.find)(l_0_3, " %-[eE][ncodemaNCODEMA]*%s+") then
  local l_0_9 = NormalizeCmdline("powershell", l_0_3)
  if l_0_9 == nil then
    return mp.CLEAN
  end
  l_0_8 = (string.lower)(l_0_9)
  l_0_7 = l_0_7 + 1
  local l_0_10 = str_count_match
  local l_0_11 = l_0_8
  local l_0_12 = {}
  -- DECOMPILER ERROR at PC86: No list found for R12 , SetList fails

end
do
  -- DECOMPILER ERROR at PC91: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC95: Overwrote pending register: R7 in 'AssignReg'

  if isIEXfound(l_0_10) then
    local l_0_13 = str_count_match
    local l_0_14 = l_0_8
    do
      local l_0_15 = {}
      -- DECOMPILER ERROR at PC100: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC126: No list found for R11 , SetList fails

      -- DECOMPILER ERROR at PC128: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC129: Overwrote pending register: R9 in 'AssignReg'

      -- DECOMPILER ERROR at PC132: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC133: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC136: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC141: Overwrote pending register: R9 in 'AssignReg'

      -- DECOMPILER ERROR at PC142: Overwrote pending register: R9 in 'AssignReg'

      if l_0_6 == true and l_0_7 >= 3 then
        return l_0_13
      else
        -- DECOMPILER ERROR at PC149: Overwrote pending register: R9 in 'AssignReg'

        -- DECOMPILER ERROR at PC150: Overwrote pending register: R9 in 'AssignReg'

        if l_0_6 == false and l_0_7 >= 2 then
          return l_0_13
        end
      end
      -- DECOMPILER ERROR at PC152: Overwrote pending register: R9 in 'AssignReg'

      -- DECOMPILER ERROR at PC153: Overwrote pending register: R9 in 'AssignReg'

      do return l_0_13 end
      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

