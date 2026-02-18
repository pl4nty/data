-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\102b31fd6790e\1.luac 

-- params : ...
-- function num : 0
local l_0_1 = nil
local l_0_2 = 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = ""
  l_0_0 = "mshta"
else
  do
    -- DECOMPILER ERROR at PC29: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC44: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC45: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC50: Unhandled construct in 'MakeBoolean' P3

    if ((this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 and not (this_sigattrlog[3]).matched) or not l_0_1 then
      return mp.CLEAN
    end
    local l_0_3 = "powershell"
    if contains(l_0_1, {"irokast", "cherryast", ".ps1", ".hta"}) then
      return mp.CLEAN
    end
    local l_0_4 = nil
    if l_0_3 == "mshta" then
      return mp.INFECTED
    end
    local l_0_5, l_0_6 = , (MpCommon.StringRegExpSearch)("[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+", l_0_1:lower())
    if l_0_6 then
      l_0_2 = l_0_2 + 5
    end
    if isIEXfound(l_0_5) then
      l_0_2 = l_0_2 + 5
    end
    if l_0_5:match("^cmd[%w%.]*%s+/c") then
      l_0_2 = l_0_2 + 5
    end
    local l_0_7 = nil
    if contains(l_0_5, {"(new-object system.net.http.httpclient).getasync", "(new-object system.net.http.httpclient).getstringasync", "(new-object system.net.webclient).downloadstring", "(new-object system.net.webclient).downloadfile", "(new-object net.webclient).downloadfile", "(new-object net.webclient).downloadstring", "[net.webclient]::downloadstring", "curl", "wget", "invoke-restmethod", "irm", "invoke-webrequest", "iwr", "invoke-expression", "iex", "invoke-command", "[scriptblock]::create", "scriptblock::create", "content).invoke()", "invoke()", "start-process", "saps", "cmd /c powershell", "://", "[char]105+[char]119+[char]114", "([text.encoding]::utf8.getstring", "([system.text.encoding]::ascii.getstring", "[system.convert]::frombase64string", "[system.text.encoding]::utf8.getstring([system.convert]::frombase64string", "-usebasicparsing", "-useb ", "-uri", "-response", "http", "substring", "downloadfile", "downloadstring"}) then
      l_0_2 = l_0_2 + 5
    end
    local l_0_8 = nil
    for l_0_12,l_0_13 in pairs({powershell = 5, mshta = 5, wscript = 4, cscript = 4, certutil = 4, rundll32 = 4, regsvr32 = 4, schtasks = 3, wmic = 3, bitsadmin = 3, curl = 2, wget = 2, cmd = 2, nslookup = 2, findstr = 2}) do
      local l_0_9 = nil
      -- DECOMPILER ERROR at PC170: Confused about usage of register: R13 in 'UnsetPending'

      if l_0_5:find(l_0_13, 1, true) and (not l_0_3 or l_0_13 ~= l_0_3) then
        l_0_2 = l_0_2 + "(new-object net.webclient).downloadstring"
      end
    end
    local l_0_14 = nil
    if select(2, l_0_5:gsub("%^", "")) > 5 then
      l_0_2 = l_0_2 + 3
    end
    if l_0_5:match("%%[%w_]+%%") then
      l_0_2 = l_0_2 + 2
    end
    if l_0_5:match("%%[%w_]+:~%d+,%d+%%") then
      l_0_2 = l_0_2 + 4
    end
    if (l_0_5:lower()):match("%f[%w]call%f[%W]") then
      l_0_2 = l_0_2 + 3
    end
    if (l_0_5:lower()):match("for%s+/f") then
      l_0_2 = l_0_2 + 4
    end
    local l_0_15 = nil
    if select(2, l_0_5:gsub("\"", "")) > 6 then
      l_0_2 = l_0_2 + 2
    end
    if (l_0_5:lower()):match("|%s*cmd") then
      l_0_2 = l_0_2 + 5
    end
    if l_0_5:match("(%w%^)%%*%w") or l_0_5:match("\"%w\"%s*\"") then
      l_0_2 = l_0_2 + 4
    end
    if l_0_2 >= 12 then
      (bm.add_related_string)("SuspClickFix_SA", tostring(l_0_1), bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("SuspClickFix_SA_score", tostring(l_0_2), bm.RelatedStringBMReport)
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

