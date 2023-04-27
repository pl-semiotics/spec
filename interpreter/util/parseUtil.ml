open Ast

module VarMap = Map.Make(String)
type space = {mutable map : int32 VarMap.t; mutable count : int32}
let empty () = {map = VarMap.empty; count = 0l}

type types = {space : space; mutable list : type_ list}
let empty_types () = {space = empty (); list = []}

type context =
  { types : types; tables : space; memories : space;
    funcs : space; locals : space; globals : space;
    datas : space; elems : space;
    labels : int32 VarMap.t; deferred_locals : (unit -> unit) list ref
  }
let empty_context () =
  { types = empty_types (); tables = empty (); memories = empty ();
    funcs = empty (); locals = empty (); globals = empty ();
    datas = empty (); elems = empty ();
    labels = VarMap.empty; deferred_locals = ref []
  }
