open Ast

module VarMap : Map.S with type key = string

type space = {mutable map : int32 VarMap.t; mutable count : int32}
val empty : unit -> space

type types = {space : space; mutable list : type_ list}
val empty_types : unit -> types

type context =
  { types : types; tables : space; memories : space;
    funcs : space; locals : space; globals : space;
    datas : space; elems : space;
    labels : int32 VarMap.t; deferred_locals : (unit -> unit) list ref
  }
val empty_context : unit -> context
