-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3f6b39bf1f335\0x0000c31b_luac 

-- params : ...
-- function num : 0
(bm.DisableSignature)()
local l_0_0, l_0_1 = nil, nil
if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p2 ~= nil then
  l_0_0 = (this_sigattrlog[9]).utf8p2
else
  if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p2 ~= nil then
    l_0_0 = (this_sigattrlog[10]).utf8p2
  end
end
if not contains(l_0_0, "downloadstring") or contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
  if contains(l_0_1, "downloadstring") then
    l_0_0 = l_0_1
  end
else
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC63: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC64: Overwrote pending register: R3 in 'AssignReg'

if ("\\landesk\\ldclient\\ivanti-psmodule")(l_0_0, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC76: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC77: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC78: Overwrote pending register: R5 in 'AssignReg'

do
  do
    if ("iex")("invoke-expression", l_0_3) then
      local l_0_4 = {}
      -- DECOMPILER ERROR at PC88: No list found for R4 , SetList fails

      -- DECOMPILER ERROR at PC89: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC90: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC91: Overwrote pending register: R7 in 'AssignReg'

      if ("pastebin.com")("paste.ee", "j.mp") then
        if IsProcNameInParentProcessTree("BM", "wmiprvse.exe") then
          (mp.TriggerScanResource)("wmi", "")
        end
        return mp.INFECTED
      end
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

