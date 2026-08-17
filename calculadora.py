import math
import tkinter as tk
from tkinter import ttk


class Calculadora(tk.Tk):

    def __init__(self):
        super().__init__()

        self.title("Calculadora Python")
        self.geometry("380x520")
        self.resizable(False, False)
        self.configure(bg="#1e1e2e")

        self.expressao = ""
        self.historico_lista = []

        self._configurar_estilos()
        self._criar_interface()

    def _configurar_estilos(self):
        self.style = ttk.Style(self)
        self.style.theme_use("clam")

        # Configurações globais de estilo de botões
        self.style.configure(
            "TButton", font=("Helvetica", 12), borderwidth=0, focuscolor="none"
        )

    def _criar_interface(self):
        # --- Painel do Histórico ---
        self.lbl_historico = tk.Label(
            self,
            text="",
            font=("Helvetica", 10),
            fg="#a6adc8",
            bg="#1e1e2e",
            anchor="e",
            padx=15,
        )
        self.lbl_historico.pack(fill="x", pady=(10, 0))

        # --- Display de Entrada/Resultado ---
        self.display = tk.Entry(
            self,
            font=("Helvetica", 24, "bold"),
            fg="#cdd6f4",
            bg="#181825",
            bd=0,
            justify="right",
            insertbackground="white",
        )
        self.display.pack(fill="x", padx=15, pady=10, ipady=10)
        self.display.bind("<Return>", lambda event: self.calcular())

        # --- Container dos Botões ---
        frame_botoes = tk.Frame(self, bg="#1e1e2e")
        frame_botoes.pack(fill="both", expand=True, padx=10, pady=10)

        # Matriz de Botões: (Texto, Linha, Coluna, Cor_Fundo, Cor_Texto, [Span_Colunas])
        botoes = [
            ("C", 0, 0, "#f38ba8", "#11111b"),
            ("(", 0, 1, "#313244", "#cdd6f4"),
            (")", 0, 2, "#313244", "#cdd6f4"),
            ("/", 0, 3, "#fab387", "#11111b"),
            ("sin", 1, 0, "#45475a", "#cdd6f4"),
            ("7", 1, 1, "#313244", "#cdd6f4"),
            ("8", 1, 2, "#313244", "#cdd6f4"),
            ("9", 1, 3, "#313244", "#cdd6f4"),
            ("*", 1, 4, "#fab387", "#11111b"),
            ("cos", 2, 0, "#45475a", "#cdd6f4"),
            ("4", 2, 1, "#313244", "#cdd6f4"),
            ("5", 2, 2, "#313244", "#cdd6f4"),
            ("6", 2, 3, "#313244", "#cdd6f4"),
            ("-", 2, 4, "#fab387", "#11111b"),
            ("tan", 3, 0, "#45475a", "#cdd6f4"),
            ("1", 3, 1, "#313244", "#cdd6f4"),
            ("2", 3, 2, "#313244", "#cdd6f4"),
            ("3", 3, 3, "#313244", "#cdd6f4"),
            ("+", 3, 4, "#fab387", "#11111b"),
            ("√", 4, 0, "#45475a", "#cdd6f4"),
            ("0", 4, 1, "#313244", "#cdd6f4"),
            (".", 4, 2, "#313244", "#cdd6f4"),
            ("^", 4, 3, "#45475a", "#cdd6f4"),
            ("=", 4, 4, "#a6e3a1", "#11111b"),
        ]

        # Configurar peso das colunas e linhas para ficarem proporcionais
        for i in range(5):
            frame_botoes.grid_columnconfigure(i, weight=1)
        for i in range(5):
            frame_botoes.grid_rowconfigure(i, weight=1)

        # Criar os botões dinamicamente
        for item in botoes:
            texto, linha, coluna, bg, fg = item[:5]

            btn = tk.Button(
                frame_botoes,
                text=texto,
                font=("Helvetica", 11, "bold"),
                bg=bg,
                fg=fg,
                activebackground="#585b70",
                activeforeground="#ffffff",
                bd=0,
                relief="flat",
                command=lambda t=texto: self._ao_clicar_botao(t),
            )
            btn.grid(row=linha, column=coluna, sticky="nsew", padx=3, pady=3)

    def _ao_clicar_botao(self, valor):
        if valor == "C":
            self.limpar()
        elif valor == "=":
            self.calcular()
        else:
            self.adicionar_caractere(valor)

    def adicionar_caractere(self, char):
        # Mapeamento para funções matemáticas
        if char in ["sin", "cos", "tan", "√"]:
            if char == "√":
                self.expressao += "sqrt("
            else:
                self.expressao += f"{char}("
        elif char == "^":
            self.expressao += "**"
        else:
            self.expressao += str(char)

        self.atualizar_display()

    def limpar(self):
        self.expressao = ""
        self.lbl_historico.config(text="")
        self.atualizar_display()

    def atualizar_display(self):
        self.display.delete(0, tk.END)
        # Exibe uma versão amigável da expressão na tela
        exibicao = (
            self.expressao.replace("**", "^")
            .replace("sqrt", "√")
            .replace("math.", "")
        )
        self.display.insert(0, exibicao)

    def calcular(self):
        if not self.expressao:
            return

        try:
            # Contexto seguro para avaliação matemática com o módulo math
            contexto_seguro = {
                "sin": lambda x: math.sin(math.radians(x)),
                "cos": lambda x: math.cos(math.radians(x)),
                "tan": lambda x: math.tan(math.radians(x)),
                "sqrt": math.sqrt,
                "pi": math.pi,
                "e": math.e,
            }

            resultado = eval(self.expressao, {"__builtins__": None}, contexto_seguro)

            # Formatação do resultado (remove casas decimais se for inteiro)
            if isinstance(resultado, float):
                resultado = round(resultado, 8)
                if resultado.is_integer():
                    resultado = int(resultado)

            # Atualizar histórico
            expressao_limpa = (
                self.expressao.replace("**", "^").replace("sqrt", "√")
            )
            self.lbl_historico.config(text=f"{expressao_limpa} =")

            self.expressao = str(resultado)
            self.atualizar_display()

        except ZeroDivisionError:
            self.display.delete(0, tk.END)
            self.display.insert(0, "Erro: Divisão por 0")
            self.expressao = ""
        except Exception:
            self.display.delete(0, tk.END)
            self.display.insert(0, "Erro de Sintaxe")
            self.expressao = ""


if __name__ == "__main__":
    app = Calculadora()
    app.mainloop()