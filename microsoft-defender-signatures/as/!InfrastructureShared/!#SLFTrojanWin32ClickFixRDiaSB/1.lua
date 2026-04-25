-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32ClickFixRDiaSB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 == 0 or l_0_0 > 700 then
  return mp.CLEAN
end
do
  if not tostring(headerpage) then
    local l_0_1, l_0_2 = tostring(footerpage)
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == nil or #l_0_1 == 0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_3 = (mp.utf16to8)(l_0_1)
  if #l_0_3 > 512 then
    return mp.CLEAN
  end
  local l_0_4, l_0_5 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if not l_0_4 or l_0_5 == nil then
    return mp.CLEAN
  end
  if type(l_0_5) ~= "string" or #l_0_5 < 10 or #l_0_5 > 2048 then
    return mp.CLEAN
  end
  local l_0_6 = (string.lower)(l_0_5)
  if (string.sub)(l_0_6, 1, 7) ~= "http://" and (string.sub)(l_0_6, 1, 8) ~= "https://" then
    return mp.CLEAN
  end
  local l_0_7 = (string.lower)(l_0_3)
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC121: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC122: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC123: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC124: Overwrote pending register: R9 in 'AssignReg'

  if not ("powershell")("pwsh", "cmd.exe") then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC135: Overwrote pending register: R10 in 'AssignReg'

  local l_0_9 = (string.gsub)(l_0_7, "%s", "cmd /c")
  if #l_0_9 < 18 then
    return mp.CLEAN
  end
  local l_0_10 = l_0_9
  local l_0_11 = {}
  -- DECOMPILER ERROR at PC146: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC147: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC148: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC149: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC150: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC151: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC152: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC153: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC154: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC155: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC156: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC157: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC158: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC159: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC160: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC161: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC162: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC163: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC164: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC165: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC166: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC167: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC168: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC177: No list found for R9 , SetList fails

  -- DECOMPILER ERROR at PC178: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC179: Overwrote pending register: R11 in 'AssignReg'

  for l_0_15,l_0_16 in ("powershell%.exe")("cmd /k") do
    -- DECOMPILER ERROR at PC182: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC184: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC185: Overwrote pending register: R17 in 'AssignReg'

    -- DECOMPILER ERROR at PC186: Overwrote pending register: R18 in 'AssignReg'

  end
  -- DECOMPILER ERROR at PC197: Overwrote pending register: R8 in 'AssignReg'

  if #l_0_10 < 12 then
    return mp.CLEAN
  end
  local l_0_17, l_0_18 = (mp.CheckUrl)(l_0_5)
  if l_0_17 == 1 and l_0_18 == 1 then
    return mp.CLEAN
  end
  local l_0_19 = {}
  local l_0_20 = SafeGetUrlReputation
  local l_0_21 = {}
  -- DECOMPILER ERROR at PC220: No list found for R14 , SetList fails

  -- DECOMPILER ERROR at PC221: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC230: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC231: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC234: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC235: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC236: Overwrote pending register: R14 in 'AssignReg'

  do
    if not ((l_0_20.urls)[l_0_5]).confidence then
      local l_0_22 = not l_0_20 or not l_0_21 or not l_0_21 or 0
    end
    -- DECOMPILER ERROR at PC251: Confused about usage of register: R15 in 'UnsetPending'

    if (l_0_21 == 2 or l_0_21 == 3 or l_0_21 == 5 or l_0_21 == 6) and l_0_22 >= 60 then
      local l_0_23 = nil
      -- DECOMPILER ERROR at PC256: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC260: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC264: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC268: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC271: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC272: Overwrote pending register: R20 in 'AssignReg'

      -- DECOMPILER ERROR at PC273: Overwrote pending register: R21 in 'AssignReg'

      -- DECOMPILER ERROR at PC274: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC277: Overwrote pending register: R23 in 'AssignReg'

      -- DECOMPILER ERROR at PC278: Overwrote pending register: R24 in 'AssignReg'

      -- DECOMPILER ERROR at PC281: Overwrote pending register: R25 in 'AssignReg'

      -- DECOMPILER ERROR at PC282: Overwrote pending register: R26 in 'AssignReg'

      if ((l_0_21 ~= 2 or l_0_21 == 3) and l_0_21 ~= 5) or l_0_21 == 6 then
        do
          do
            set_research_data("ClickFixRDia_SB", "msiexec" .. "curl.exe" .. ("certutil")("bitsadmin") .. "||" .. ("wmic")("forfiles") .. "||" .. ("hh.exe")("ieexec"), false)
            do return mp.INFECTED end
            -- DECOMPILER ERROR at PC290: Overwrote pending register: R14 in 'AssignReg'

            -- DECOMPILER ERROR at PC291: Overwrote pending register: R14 in 'AssignReg'

            do return l_0_21 end
            -- WARNING: undefined locals caused missing assignments!
          end
        end
      end
    end
  end
end

