-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bfb307085186\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

  if not isIEXfound(l_0_0) then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if not contains(l_0_3, {"new-object system.net.http.httpclient", "downloadstring", "curl", "wget", "invoke-restmethod", "irm", "invoke-webrequest", "iwr", "invoke-command"}) then
    return mp.CLEAN
  end
  return mp.INFECTED
end

