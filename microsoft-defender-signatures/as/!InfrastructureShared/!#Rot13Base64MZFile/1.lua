-- Threat: !InfrastructureShared
-- Name: !#Rot13Base64MZFile
-- Type: 13
-- MpAttributes: BRUTE:Rot13Base64MZFile

mp.readprotection(false)
local l_0_0 = mp.readfile(0, mp.getfilesize())
local l_0_1 = l_0_0:find("GI[dc]DNN[ZV]NNNNRNN")
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  A = "N",
  B = "O",
  C = "P",
  D = "Q",
  E = "R",
  F = "S",
  G = "T",
  H = "U",
  I = "V",
  J = "W",
  K = "X",
  L = "Y",
  M = "Z",
  N = "A",
  O = "B",
  P = "C",
  Q = "D",
  R = "E",
  S = "F",
  T = "G",
  U = "H",
  V = "I",
  W = "J",
  X = "K",
  Y = "L",
  Z = "M",
  a = "n",
  b = "o",
  c = "p",
  d = "q",
  e = "r",
  f = "s",
  g = "t",
  h = "u",
  i = "v",
  j = "w",
  k = "x",
  l = "y",
  m = "z",
  n = "a",
  o = "b",
  p = "c",
  q = "d",
  r = "e",
  s = "f",
  t = "g",
  u = "h",
  v = "i",
  w = "j",
  x = "k",
  y = "l",
  z = "m",
  ["0"] = "0",
  ["1"] = "1",
  ["2"] = "2",
  ["3"] = "3",
  ["4"] = "4",
  ["5"] = "5",
  ["6"] = "6",
  ["7"] = "7",
  ["8"] = "8",
  ["9"] = "9",
  ["+"] = "+",
  ["/"] = "/",
  ["="] = "="
}
local l_0_3 = l_0_0:match("[A-Za-z0-9+/=]+", l_0_1)
local l_0_4 = l_0_3:gsub(".", l_0_2)
mp.vfo_add_buffer(l_0_4, "[Base64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
