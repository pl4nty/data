-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaJsObfusPathExcluA\0x00001b88_luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.getfilename)())
if l_0_0 ~= nil then
  local l_0_1 = (string.sub)(l_0_0, -3)
  local l_0_2 = (string.sub)(l_0_0, -4)
  if l_0_0:match("%->.+/") or l_0_0:match("%->.+\\") or l_0_0:match("%->.+%->") then
    return mp.CLEAN
  end
  if l_0_1 == ".js" or l_0_2 == ".jse" or l_0_2 == ".vbs" or l_0_2 == ".vbe" or l_0_2 == ".wsf" then
    local l_0_3 = (MpCommon.PathToWin32Path)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
    if l_0_3 == nil then
      return mp.CLEAN
    end
    if IsInternetCache(l_0_3) == true then
      return mp.INFECTED
    end
    do
      do
        if l_0_3:find(":\\users\\[^\\]+\\appdata\\local\\temp", 1, true) then
          local l_0_4 = (string.match)(l_0_3, "\\appdata\\local\\temp\\(.+)")
          if l_0_4 and not l_0_4:find("\\", 1, true) then
            (mp.set_mpattribute)("Lua:JsObfusPathInclusion.A")
          end
        end
        if l_0_3:find("\\program files\\", 1, true) or l_0_3:find("\\clientaccess\\owa\\prem\\", 1, true) or l_0_3:find(":\\windows\\", 1, true) or l_0_3:find(":\\program files (x86)\\", 1, true) or l_0_3:find("\\google\\chrome\\user data\\default\\extensions\\", 1, true) or l_0_3:find("\\google\\chrome\\user data\\profile", 1, true) or l_0_3:find("\\device\\harddiskvolume", 1, true) or l_0_3:find(":\\inetpub\\", 1, true) or l_0_3:find("\\netlogon\\", 1, true) or l_0_3:find(":\\programdata\\microsoft\\grouppolicy\\users\\", 1, true) or l_0_3:find("\\mozilla\\firefox\\profiles\\", 1, true) or l_0_3:find("\\programdata\\lenovo\\userguide", 1, true) or l_0_3:find("\\google\\chrome\\user data\\default\\extensions", 1, true) or l_0_3:find("documents and settings", 1, true) then
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
end

