-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1bdb32ffc6a4f\1.luac 

-- params : ...
-- function num : 0
local l_0_2, l_0_5, l_0_8, l_0_12 = nil, nil, nil
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_4, l_0_7, l_0_10, l_0_11 = (string.lower)((this_sigattrlog[1]).utf8p2)
  else
  end
  do
    if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[3]).matched) and (this_sigattrlog[3]).utf8p2 ~= nil then
      local l_0_3, l_0_6, l_0_9, l_0_13 = (string.lower)((this_sigattrlog[2]).utf8p2), (string.lower)((this_sigattrlog[3]).utf8p2)
    else
    end
    -- DECOMPILER ERROR at PC74: Confused about usage of register: R2 in 'UnsetPending'

    if (not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p2 == nil or (string.lower)((this_sigattrlog[4]).utf8p2)) and (string.len)((string.lower)((this_sigattrlog[4]).utf8p2)) < 500 then
      return mp.CLEAN
    end
    local l_0_14 = nil
    if contains(l_0_14, {"install_acs_64.js"}) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC105: Confused about usage of register: R1 in 'UnsetPending'

    if l_0_14 == nil or (string.match)(l_0_14, "wscript.*%s+%\"?%\'?(%w:\\.*%.js)") ~= nil then
      local l_0_15 = nil
      if (mp.ContextualExpandEnvironmentVariables)((string.match)(l_0_14, "wscript.*%s+%\"?%\'?(%w:\\.*%.js)")) and (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)((string.match)(l_0_14, "wscript.*%s+%\"?%\'?(%w:\\.*%.js)"))) then
        local l_0_16, l_0_17 = nil
        if (mp.GetMotwZoneForFile)((mp.ContextualExpandEnvironmentVariables)((string.match)(l_0_14, "wscript.*%s+%\"?%\'?(%w:\\.*%.js)"))) and (mp.ContextualExpandEnvironmentVariables)((string.match)(l_0_14, "wscript.*%s+%\"?%\'?(%w:\\.*%.js)")) == 3 then
          (bm.add_related_file)((mp.ContextualExpandEnvironmentVariables)((string.match)(l_0_14, "wscript.*%s+%\"?%\'?(%w:\\.*%.js)")))
          return mp.INFECTED
        end
      end
    end
    do
      return mp.CLEAN
    end
  end
end

