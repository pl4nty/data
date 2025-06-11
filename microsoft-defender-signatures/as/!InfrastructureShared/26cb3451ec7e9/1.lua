-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\26cb3451ec7e9\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 0
local l_0_1 = 0
local l_0_2, l_0_3 = nil, nil
local l_0_4 = false
local l_0_5 = nil
local l_0_6 = false
local l_0_7 = nil
local l_0_8 = {}
-- DECOMPILER ERROR at PC18: No list found for R8 , SetList fails

local l_0_9 = {}
-- DECOMPILER ERROR at PC20: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC21: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC22: No list found for R9 , SetList fails

-- DECOMPILER ERROR at PC23: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC37: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC39: Overwrote pending register: R12 in 'AssignReg'

if (("certutil")[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  for l_0_13 = 1, ("msiexec").SIGATTR_LOG_SZ, "scriptrunner" do
    -- DECOMPILER ERROR at PC41: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC63: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC65: Overwrote pending register: R16 in 'AssignReg'

    if (("cscript")[l_0_13]).matched and (sigattr_head[l_0_13]).attribute == 16400 and (sigattr_head[l_0_13]).utf8p2 then
      if not l_0_4 or isnull(l_0_5) or type(l_0_5) ~= "table" or isnull(#l_0_5) then
        return mp.CLEAN
      end
      if #l_0_5 == 1 or l_0_5[1] == nil then
        return mp.CLEAN
      end
    end
  end
  if not contains(l_0_2, l_0_8) or #l_0_2 <= 50 or contains(l_0_2, l_0_9) or not l_0_1 or not l_0_0 or l_0_1 >= l_0_0 or l_0_0 - l_0_1 <= 30000000 or not l_0_6 then
    return mp.CLEAN
  end
  if not l_0_3 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC153: Overwrote pending register: R7 in 'AssignReg'

  if not contains(l_0_3, "powershell.exe") or isnull(l_0_7) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC168: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC173: Overwrote pending register: R7 in 'AssignReg'

  do
    local l_0_14 = {}
    -- DECOMPILER ERROR at PC181: Overwrote pending register: R17 in 'AssignReg'

    -- DECOMPILER ERROR at PC182: Overwrote pending register: R18 in 'AssignReg'

    -- DECOMPILER ERROR at PC223: No list found for R10 , SetList fails

    -- DECOMPILER ERROR at PC224: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC225: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC226: Overwrote pending register: R13 in 'AssignReg'

    if not ("(new-object system.net.http.httpclient).getasync")("(new-object system.net.http.httpclient).getstringasync", "(new-object system.net.webclient).downloadstring") then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC237: Overwrote pending register: R14 in 'AssignReg'

    ;
    (bm.add_related_string)("RUNMRU_cmdline", l_0_2, ("(new-object system.net.webclient).downloadfile").RelatedStringBMReport)
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

