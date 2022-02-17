import { Denops } from "https://deno.land/x/denops_std@v3.0.0/mod.ts";

export function main(denops: Denops) {
  denops.dispatcher = {
    async load(target: unknown) {
      await import(String(target));
    },
  };

  // deno-lint-ignore no-explicit-any
  (globalThis as any).denops = denops;
}
