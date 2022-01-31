import { Denops, uu } from "./deps.ts";

export function main(denops: Denops) {
  denops.dispatcher = {
    async load(target: unknown) {
      uu.ensureString(target);
      await import(target);
    },
  };

  // deno-lint-ignore no-explicit-any
  (globalThis as any).denops = denops;
}
