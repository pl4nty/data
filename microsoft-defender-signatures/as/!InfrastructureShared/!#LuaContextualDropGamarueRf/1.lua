-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualDropGamarueRf
-- Type: 9
-- MpAttributes: RPF:ContextualDropGamarueRf

if peattributes.isexe then
  local l_0_0 = mp.getfilename()
  if l_0_0:sub(-4) == ".exe" then
    local l_0_1
    local l_0_2 = {
      "tray",
      "xpers",
      "mgr",
      "agent",
      "ctrl",
      "sync",
      "use",
      "start",
      "win"
    }
    local l_0_3 = l_0_0:match("([^\\]+)%..+")
    for l_0_4 = 1, #l_0_2 do
      l_0_1 = l_0_2[l_0_4]
      if l_0_3:sub(1, #l_0_1) == l_0_1 or l_0_3:sub(1, -#l_0_1) == l_0_1 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
