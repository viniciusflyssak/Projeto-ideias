unit frmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Dapt, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TfrmTelaPrincipal = class(TForm)
    PFundo: TPanel;
    LDivisao: TLabel;
    LObjetivoApp: TLabel;
    LTitulo: TLabel;
    LUsuario: TLabel;
    edtUsuario: TEdit;
    LIdeia: TLabel;
    edtIdeia: TEdit;
    btnEnviar: TButton;
    Conn: TFDConnection;
    procedure btnEnviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaPrincipal: TfrmTelaPrincipal;
  usuario: string;
  ideia: string;

implementation

{$R *.fmx}

procedure TfrmTelaPrincipal.btnEnviarClick(Sender: TObject);
var
  qryIdeia: TFDQuery;
begin
  usuario := edtUsuario.Text;
  ideia := edtIdeia.Text;
  qryIdeia := TFDQuery.Create(nil);
  try
    qryIdeia.Connection := conn;
    qryIdeia.SQL.Add(' Insert into ideias values (:pUsuario, :pIdeia) ');
    qryIdeia.ParamByName('pUsuario').AsString := usuario;
    qryIdeia.ParamByName('pIdeia').AsString := ideia;
    qryIdeia.ExecSQL;
    showmessage('Sucesso!');
    edtUsuario.Text := '';
    edtIdeia.Text := '';
  finally
    qryIdeia.Free;
  end;

end;

end.
