-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\137b314f2591e\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_5, l_0_7, l_0_9 = nil, nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if #l_0_0 < 62 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

  if contains(l_0_0, "powershell.exe") then
    local l_0_4, l_0_6, l_0_8 = , NormalizeCmdline("powershell", l_0_0)
  else
    do
      -- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

      if isnull(NormalizeCmdline("cmd", l_0_4)) then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

      local l_0_10 = nil
      local l_0_11 = (string.lower)((string.gsub)(NormalizeCmdline("cmd", l_0_4), "[\"\'()+]", ""))
      if not contains(l_0_11, {"new-object system.net.http.httpclient", ".downloadstring", ".downloadfile", "[net.webclient]::downloadstring", "curl", "wget", "invoke-restmethod", "irm", "invoke-webrequest", "iwr", "iex", "invoke-expression", "invoke-command", "[scriptblock]::create", "scriptblock::create", "start-process", "base64", "-bxor", "ransom", "start-process", "hidden", "ping", "promptrestart", "invoke", "webrequest"}) then
        return mp.CLEAN
      end
      ;
      (bm.add_related_string)("FileFix_cmdlineRemediation", l_0_10, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
end

