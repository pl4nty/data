-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\85b3b366a940\0x00000e27_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0 = nil
  end
  local l_0_1 = nil
  if l_0_1 ~= nil then
    local l_0_2 = nil
    local l_0_3 = (function(l_1_0)
  -- function num : 0_0
  local l_1_1 = {}
  for l_1_5 in (string.gmatch)(l_1_0, "http[s]?://[^\"%s]+") do
    (table.insert)(l_1_1, l_1_5)
  end
  return l_1_1
end
)(l_0_1)
    for l_0_7,l_0_8 in ipairs(l_0_3) do
      local l_0_4 = {SIG_CONTEXT = "BM", CONTENT_SOURCE = "ITW_PS_SCHTASK", PROCESS_CONTEXT = "powershell.exe", FILELESS = "true", CMDLINE_URL = "true"}
      -- DECOMPILER ERROR at PC35: Confused about usage of register: R8 in 'UnsetPending'

      if (string.match)(R8_PC35, "^https?://") then
        local l_0_10 = (mp.CheckUrl)(R8_PC35)
        if l_0_10 == 1 and R8_PC35 == 1 then
          return mp.CLEAN
        end
        local l_0_11 = nil
        local l_0_12 = SafeGetUrlReputation
        l_0_12 = l_0_12({l_0_9}, l_0_4, false, 3000)
        if (l_0_12.urls)[l_0_9] and ((l_0_12.urls)[l_0_9]).determination == 2 and ((l_0_12.urls)[l_0_9]).confidence >= 60 then
          return mp.INFECTED
        end
      end
    end
  end
  do
    l_0_3 = mp
    l_0_3 = l_0_3.CLEAN
    return l_0_3
  end
end

