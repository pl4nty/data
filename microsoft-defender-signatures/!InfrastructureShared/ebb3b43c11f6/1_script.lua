-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ebb3b43c11f6\1_luac 

-- params : ...
-- function num : 0
local l_0_3 = nil
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2 = (string.lower)((this_sigattrlog[1]).utf8p2), nil
  else
  end
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_4 = (string.lower)((this_sigattrlog[2]).utf8p2)
    if contains(l_0_4, {"install_acs_64.js"}) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

    if l_0_4 == nil or (string.match)(l_0_4, "wscript.*%s+%\"?%\'?(%w:\\.*%.js)") ~= nil then
      local l_0_5 = nil
      if (mp.ContextualExpandEnvironmentVariables)((string.match)(l_0_4, "wscript.*%s+%\"?%\'?(%w:\\.*%.js)")) and (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)((string.match)(l_0_4, "wscript.*%s+%\"?%\'?(%w:\\.*%.js)"))) then
        local l_0_6, l_0_7 = nil
        if (mp.GetMotwZoneForFile)((mp.ContextualExpandEnvironmentVariables)((string.match)(l_0_4, "wscript.*%s+%\"?%\'?(%w:\\.*%.js)"))) and (mp.ContextualExpandEnvironmentVariables)((string.match)(l_0_4, "wscript.*%s+%\"?%\'?(%w:\\.*%.js)")) == 3 then
          (bm.add_related_file)(l_0_7)
          return mp.INFECTED
        end
      end
    end
    do
      return mp.CLEAN
    end
  end
end

