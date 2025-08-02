-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaUrlFileInStartupA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = l_1_0:gsub("^file:///", "")
  l_1_1 = l_1_1:gsub("/", "\\")
  l_1_1 = l_1_1:gsub("%%(%x%x)", function(l_2_0)
    -- function num : 0_0_0
    local l_2_1 = string.char
    do
      local l_2_2, l_2_3, l_2_4 = tonumber(l_2_0, 16), .end
      do return l_2_1(l_2_2, l_2_3, l_2_4) end
      -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
  end
)
  return l_1_1
end

local l_0_1 = function(l_2_0)
  -- function num : 0_1
  do return l_2_0:match("^[A-Za-z]:\\[^:*?\"<>|]+$") ~= nil end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local l_0_2 = (mp.getfilesize)()
if l_0_2 > 4096 then
  (mp.set_mpattribute)("Lua:UrlFileInStartupFileSizeGT0x1000")
  return mp.CLEAN
end
local l_0_3 = tostring(headerpage)
if l_0_3 == nil or #l_0_3 < 24 then
  return mp.CLEAN
end
local l_0_4 = l_0_3:match("[Uu][Rr][Ll]%s*=%s*\"?(.-)[\r\n\'\"]")
if l_0_4 == nil or #l_0_4 <= 3 or StringStartsWith(l_0_4, "http") then
  return mp.CLEAN
end
if #l_0_4 > 8 and StringStartsWith(l_0_4, "file:///") then
  l_0_4 = l_0_0(l_0_4)
end
if l_0_4 ~= nil and #l_0_4 > 2 then
  if (sysio.IsFileExists)(l_0_4) then
    (mp.set_mpattribute)("Lua:UrlFileInStartupWithTargetExist.A")
    ;
    (mp.set_mpattribute)("MpInternal_researchdata=urlfileinstartuptargetexist=" .. l_0_4)
    ;
    (mp.ReportLowfi)(l_0_4, 3186240911)
    return mp.INFECTED
  end
  if l_0_1(l_0_4) then
    AppendToRollingQueue("UrlFileInStartupTargetA", "url_path", l_0_4)
    ;
    (mp.set_mpattribute)("Lua:UrlFileInStartupWithTargetNotExist.A")
    ;
    (mp.set_mpattribute)("MpInternal_researchdata=urlfileinstartuptargetnotexist=" .. l_0_4)
  end
end
return mp.CLEAN

