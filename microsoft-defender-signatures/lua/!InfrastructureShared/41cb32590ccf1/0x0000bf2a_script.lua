-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41cb32590ccf1\0x0000bf2a_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil, nil
  else
  end
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

  if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (string.lower)((this_sigattrlog[2]).utf8p2) ~= nil then
    local l_0_4 = nil
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

    if (string.match)((string.lower)((this_sigattrlog[2]).utf8p2), "wscript.*%s+%\"?%\'?(%w:\\.*%.js)") ~= nil then
      local l_0_5 = nil
      if (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)((string.match)((string.lower)((this_sigattrlog[2]).utf8p2), "wscript.*%s+%\"?%\'?(%w:\\.*%.js)"))) then
        (bm.add_threat_file)((mp.ContextualExpandEnvironmentVariables)((string.match)((string.lower)((this_sigattrlog[2]).utf8p2), "wscript.*%s+%\"?%\'?(%w:\\.*%.js)")))
      end
    end
  end
  do
    return mp.INFECTED
  end
end

